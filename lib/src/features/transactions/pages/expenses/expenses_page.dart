import 'package:budget/src/features/transactions/constants/transactions_items.dart';
import 'package:budget/src/features/transactions/controller/date_controller.dart';
import 'package:budget/src/features/transactions/controller/dropdown_controller.dart';
import 'package:budget/src/features/transactions/pages/transactions/stores/transactions_store.dart';
import 'package:budget/src/features/transactions/widgets/appbar_with_drawer.dart';
import 'package:budget/src/features/transactions/widgets/button_widget.dart';
import 'package:budget/src/features/transactions/widgets/date_picker_widget.dart';

import 'package:budget/src/features/transactions/widgets/dialog_widget.dart';
import 'package:budget/src/features/transactions/widgets/dropdown_button_widget.dart';
import 'package:budget/src/features/transactions/widgets/text_styles.dart';
import 'package:budget/src/shared/constants/constants.dart';
import 'package:budget/src/shared/models/models.dart';
import 'package:budget/src/shared/validators/validators.dart';
import 'package:budget/src/shared/widgets/custom_text_field.dart';
import 'package:budget/src/shared/widgets/drawer/drawer_widget.dart';
import 'package:easy_mask/easy_mask.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'expenses_store.dart';

class ExpensesPage extends StatefulWidget {
  final TransactionModel? data;
  const ExpensesPage({Key? key, this.data}) : super(key: key);

  @override
  _ExpensesPageState createState() => _ExpensesPageState();
}

class _ExpensesPageState extends ModularState<ExpensesPage, ExpensesStore> {
  TextEditingController _expensesController = TextEditingController();
  DropdownController _outputTypeController = DropdownController(items: TransactionsItems.expensesItems);
  DateController _dateController = DateController();

  FocusNode _expensesFocusNode = FocusNode();
  FocusNode _inputTypeFocusNode = FocusNode();
  FocusNode _dateFocusNode = FocusNode();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final MagicMask mask = MagicMask.buildMask('9+,999,99');
  @override
  void initState() {
    super.initState();
    if (widget.data != null) {
      print(123);
      print(mask.getMaskedString(widget.data!.value.toString()));
      _expensesController = TextEditingController(text: mask.getMaskedString(widget.data!.value.toString()));

      _outputTypeController.value =
          TransactionsItems.expensesItems.firstWhere((item) => item.key == widget.data!.category);
      _dateController.date = widget.data!.createAt;
    }
  }

  late TransactionModel _newData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWithDrawer(title: "Saída"),
      drawer: DrawerWidget(),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Container(
          height: 400,
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              Card(
                color: Colors.white,
                elevation: 3.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(7.0),
                  ),
                ),
                child: Container(
                  height: 370,
                  padding: const EdgeInsets.symmetric(horizontal: 54),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 55,
                            bottom: 12,
                          ),
                          child: CustomTextField(
                              hintText: "Valor",
                              labelText: "Valor em R\$",
                              keyboardType: TextInputType.number,
                              focusNode: _expensesFocusNode,
                              controller: _expensesController,
                              inputFormatters: [
                                TextInputMask(
                                  mask: '999.999.999.999.999.999,99',
                                  placeholder: '0',
                                  maxPlaceHolders: 3,
                                  reverse: true,
                                )
                              ],
                              validator: (value) {
                                Validators().validateNumber(value!.replaceAll('.', '').replaceAll(',', '.'));
                              }),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Tipo de saída",
                                style: TextStyles.black12w400RobotoOp54,
                              ),
                              DropdownButtonWidget(
                                  value: _outputTypeController.value,
                                  items: _outputTypeController.items,
                                  focusNode: _inputTypeFocusNode,
                                  validator: (value) => Validators().validateTransactionCategory(value?.key),
                                  onChanged: (newValue) {
                                    _outputTypeController.value = newValue!;
                                    setState(() {});
                                  }),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 12,
                          ),
                          child: DatePickerWidget(
                            date: _dateController.date,
                            controller: _dateController,
                            focusNode: _dateFocusNode,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                child: ButtonWidget(
                  label: widget.data == null ? "INSERIR" : "ATUALIZA",
                  onPressed: () async {
                    FocusScope.of(context).unfocus();
                    if (_formKey.currentState!.validate()) {
                      _newData = TransactionModel(
                        value: double.parse(_expensesController.value.text.replaceAll('.', '').replaceAll(',', '.')),
                        type: TypeTransaction.output,
                        category: TransactionCategories.output[_outputTypeController.value!.key]!,
                        createAt: _dateController.date,
                        updateAt: _dateController.date,
                      );

                      final String? returnedId;
                      bool isUpdated = false;
                      if (widget.data == null) {
                        returnedId = await store.createTransaction(transaction: _newData);
                      } else {
                        _newData = widget.data!.copyWith(
                          value: double.parse(_expensesController.value.text.replaceAll('.', '').replaceAll(',', '.')),
                          category: TransactionCategories.output[_outputTypeController.value!.key]!,
                          createAt: _dateController.date,
                          updateAt: _dateController.date,
                        );
                        final List<TransactionModel> list = Modular.get<TransactionsStore>().transactions;
                        list.remove(widget.data!);
                        list.add(_newData);
                        await store.updateTransaction(transaction: _newData);
                        returnedId = null;
                        isUpdated = true;
                        Modular.to.pop();
                      }

                      if (returnedId != null) {
                        _newData = _newData.copyWith(id: returnedId);
                        final List<TransactionModel> list = Modular.get<TransactionsStore>().transactions;
                        list.add(_newData);
                        Modular.to.pop();
                      }

                      if (returnedId != null || isUpdated) {
                        showDialog(
                          context: context,
                          builder: (_) => DialogWidget(
                            message: isUpdated ? "Dado atualizado com sucesso" : "Dado enviado com sucesso",
                          ),
                        );
                      }
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
