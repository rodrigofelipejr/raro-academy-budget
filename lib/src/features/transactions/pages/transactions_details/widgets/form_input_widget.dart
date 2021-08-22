import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../../shared/constants/constants.dart';
import '../../../../../shared/models/models.dart';
import '../../../../../shared/stores/stores.dart';
import '../../../../../shared/utils/utils.dart';
import '../../../../../shared/validators/validators.dart';
import '../../../../../shared/widgets/widgets.dart';
import '../../../constants/transactions_items.dart';
import '../../../transactions.dart';
import '../../../widgets/widgets.dart';

class FormInputWidget extends StatefulWidget {
  final TransactionModel? transaction;

  const FormInputWidget({Key? key, this.transaction}) : super(key: key);

  @override
  _FormInputWidgetState createState() => _FormInputWidgetState();
}

class _FormInputWidgetState extends State<FormInputWidget> with KeyboardManager {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  late final TransactionsDetailsStore store;
  late final AuthStore _authStore;

  TextEditingController _inputValueController = TextEditingController();
  DropdownController _inputTypeController = DropdownController(items: TransactionsItems.incomeItems);
  TextEditingController _inputDescriptionController = TextEditingController();
  DateController _inputDateController = DateController();

  FocusNode _inputValueFocusNode = FocusNode();
  FocusNode _inputTypeFocusNode = FocusNode();
  FocusNode _inputDescriptionFocusNode = FocusNode();
  FocusNode _inputDateFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _authStore = Modular.get<AuthStore>();
    store = Modular.get<TransactionsDetailsStore>();

    if (widget.transaction != null) {
      _inputValueController.text = Formatters.formatMoney(widget.transaction?.value ?? 0.0, prefix: false);
      _inputDescriptionController.text = widget.transaction?.description ?? '';
      _inputTypeController.value =
          TransactionsItems.incomeItems.firstWhere((item) => item.key == widget.transaction!.category);
      _inputDateController.date = widget.transaction?.createAt ?? DateTime.now();
    }
  }

  @override
  void dispose() {
    _inputValueController.dispose();
    _inputDescriptionController.dispose();
    _inputValueFocusNode.dispose();
    _inputTypeFocusNode.dispose();
    _inputDescriptionFocusNode.dispose();
    _inputDateFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      alignment: Alignment.topCenter,
      children: [
        SingleChildScrollView(
          physics: ClampingScrollPhysics(),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              HeaderFormsWidget(
                title: 'Entradas',
              ),
              Container(
                margin: const EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0, bottom: 28.0),
                child: CardWidget(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Form(
                        key: _formKey,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomTextField(
                              // hintText: "Valor",
                              labelText: "Valor em R\$",
                              keyboardType: TextInputType.number,
                              controller: _inputValueController,
                              validator: (value) => Validators.validateNumber(value!),
                              focusNode: _inputValueFocusNode,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly,
                              ],
                              textInputAction: TextInputAction.next,
                            ),
                            SizedBox(height: 14.0),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Tipo de entrada",
                                  style: AppTextStyles.black12w400Roboto,
                                ),
                                DropdownButtonWidget(
                                  value: _inputTypeController.value,
                                  items: _inputTypeController.items,
                                  focusNode: _inputTypeFocusNode,
                                  validator: (value) => Validators.validateTransactionCategory(value?.key),
                                  onChanged: (value) {
                                    _inputTypeController.value = value;
                                    setState(() {}); //STUB - verificar
                                  },
                                ),
                              ],
                            ),
                            SizedBox(height: 14.0),
                            CustomTextField(
                              hintText: "Nome da entrada",
                              labelText: "Informe uma descrição",
                              keyboardType: TextInputType.text,
                              controller: _inputDescriptionController,
                              focusNode: _inputDescriptionFocusNode,
                              validator: (value) => Validators.validateDescription(value),
                              textInputAction: TextInputAction.next,
                            ),
                            SizedBox(height: 14.0),
                            DatePickerWidget(
                              date: _inputDateController.date,
                              controller: _inputDateController,
                              focusNode: _inputDateFocusNode,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 14.0,
          child: FabWidget(
            label: AppStrings.txtInserir,
            onTap: () => _onSaveTransaction(context),
          ),
        ),
      ],
    );
  }

  void _onSaveTransaction(BuildContext context) async {
    hideKeyboard(context);

    if (_formKey.currentState!.validate()) {
      final transaction = TransactionModel(
        uuid: _authStore.user!.uuid,
        value: double.parse(_inputValueController.value.text),
        type: TypeTransaction.input,
        category: TransactionCategories.input[_inputTypeController.value!.key]!,
        description: _inputDescriptionController.value.text,
      );

      print('DATA ${transaction.toMap()}');
      print('DATA ${transaction.toMapFirestore()}');

      //   final String? returnedId;
      //   bool isUpdated = false;
      //   if (widget.data == null) {
      //     returnedId = await store.createTransaction(transaction: _newData);
      //   } else {
      //     _newData = widget.data!.copyWith(
      //       value: double.parse(_incomeController.value.text),
      //       category: TransactionCategories.input[_inputTypeController.value!.key]!,
      //       description: _inputNameController.value.text,
      //       updateAt: _dateController.date,
      //     );
      //     final List<TransactionModel> list = Modular.get<TransactionsStore>().transactions;
      //     list.remove(widget.data!);
      //     list.add(_newData);
      //     await store.updateTransaction(transaction: _newData);
      //     returnedId = null;
      //     isUpdated = true;
      //     Modular.to.pop();
      //   }

      //   if (returnedId != null) {
      //     _newData = _newData.copyWith(id: returnedId);
      //     final List<TransactionModel> list = Modular.get<TransactionsStore>().transactions;
      //     list.add(_newData);
      //     Modular.to.pop();
      //   }

      //   if (returnedId != null || isUpdated) {
      //     showDialog(
      //       context: context,
      //       builder: (_) => DialogWidget(
      //         message: isUpdated ? "Dado atualizado com sucesso" : "Dado enviado com sucesso",
      //       ),
      //     );
      //   }
      // }
      // // store.repository.showTransactions();
      // // store.repository.showDocs();
      // print(store.authStore.firebaseAuth.currentUser!.uid);
      // print("TRANSACTIONS STORE");
      // Modular.get<TransactionsStore>().transactions.forEach((element) => print(element));
    }
  }
}

class DropdownController {
  DropdownItemData? value;
  final List<DropdownItemData> items;
  DropdownController({required this.items});
}

class DateController {
  DateTime date;
  DateController() : date = DateTime.now();
  String toString() => Dates.parseDateTimeToString(date);
}
