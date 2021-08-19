import 'package:budget/src/features/transactions/constants/transactions_items.dart';
import 'package:budget/src/features/transactions/controller/date_controller.dart';
import 'package:budget/src/features/transactions/controller/dropdown_controller.dart';
import 'package:budget/src/features/transactions/validators/text_validator.dart';
import 'package:budget/src/features/transactions/widgets/appbar_with_drawer.dart';
import 'package:budget/src/features/transactions/widgets/button_widget.dart';
import 'package:budget/src/features/transactions/widgets/date_picker_widget.dart';
import 'package:budget/src/features/transactions/widgets/dropdown_buttom_widget.dart';
import 'package:budget/src/features/transactions/widgets/text_styles.dart';
import 'package:budget/src/shared/models/models.dart';
import 'package:budget/src/shared/widgets/custom_text_field.dart';
import 'package:budget/src/shared/widgets/drawer/drawer_widget.dart';
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
  DropdownController _inputTypeController =
      DropdownController(items: TransactionsItems.expensesItems);
  DateController _dateController = DateController();

  FocusNode _expensesFocusNode = FocusNode();
  FocusNode _inputTypeFocusNode = FocusNode();
  FocusNode _dateFocusNode = FocusNode();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // late TransactionModel _data;
  void initState() {
    super.initState();
    _expensesController =
        TextEditingController(text: widget.data?.value.toString());

    _dateController.date = widget.data?.createAt ?? DateTime.now();

    _inputTypeController.value = TransactionsItems.expensesItems
        .where((element) => element.value == "Viagem")
        .first;
  }

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
                            validator: (value) =>
                                Validators().validateNumber(value!),
                          ),
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
                              DropdownButtomWidget(
                                  value: _inputTypeController.value,
                                  items: _inputTypeController.items,
                                  focusNode: _inputTypeFocusNode,
                                  validator: (value) => Validators()
                                      .validateTransactionCategory(value),
                                  onChanged: (newValue) {
                                    _inputTypeController.value = newValue!;
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
                  label: "INSERIR",
                  onPressed: () {
                    // FocusScope.of(context).unfocus();
                    // if (_formKey.currentState!.validate()) {
                    //   _data = TransactionModel(
                    //     value: double.parse(_expensesController.value.text),
                    //     type: 'output',
                    //     category: _inputTypeController.value!.value,
                    //     createAt: _dateController.date,
                    //     updateAt: _dateController.date,
                    //     uuid: 'asdfg',
                    //   );
                    //   // _controller.repository.deleteTransaction("cKwzRsuGMJ6VREv6ZVHS");
                    //   // _controller.repository.createTransaction(_data);
                    //   print('DATA ${_data.toString()}');
                    //   _controller.repository.getTransactions();
                    //   _controller.repository.getDocs();

                    //   //Adiciona nova transacao na lista
                    //   // final list = Modular.get<DailyStore>().transactions();
                    //   // list.add(_data);
                    //   // Modular.get<DailyStore>().setTransactions();
                    //   // Modular.to.pushReplacementNamed(AppRoutes.daily);
                    //   showDialog(
                    //     context: context,
                    //     builder: (_) => DialogWidget(
                    //       message: "Dado enviado com sucesso",
                    //     ),
                    //   );
                    // }
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
