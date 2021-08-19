import 'package:budget/src/features/home/widgets/daily/daily_store.dart';
import 'package:budget/src/features/transactions/constants/transactions_items.dart';
import 'package:budget/src/features/transactions/controller/date_controller.dart';
import 'package:budget/src/features/transactions/controller/dropdown_controller.dart';
import 'package:budget/src/features/transactions/pages/income/income_store.dart';
import 'package:budget/src/features/transactions/pages/transactions/transactions_store.dart';
import 'package:budget/src/features/transactions/validators/text_validator.dart';
import 'package:budget/src/features/transactions/widgets/appbar_with_drawer.dart';
import 'package:budget/src/features/transactions/widgets/button_widget.dart';
import 'package:budget/src/features/transactions/widgets/date_picker_widget.dart';
import 'package:budget/src/features/transactions/widgets/dialog_widget.dart';
import 'package:budget/src/features/transactions/widgets/dropdown_buttom_widget.dart';
import 'package:budget/src/features/transactions/widgets/dropdown_item_data.dart';
import 'package:budget/src/features/transactions/widgets/text_styles.dart';
import 'package:budget/src/shared/constants/app_colors.dart';
import 'package:budget/src/shared/models/models.dart';
import 'package:budget/src/shared/widgets/custom_text_field.dart';
import 'package:budget/src/shared/widgets/drawer/drawer_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class IncomePage extends StatefulWidget {
  const IncomePage({Key? key, this.data}) : super(key: key);
  final TransactionModel? data;

  @override
  _IncomePageState createState() => _IncomePageState();
}

class _IncomePageState extends ModularState<IncomePage, IncomeStore> {
  TextEditingController _incomeController = TextEditingController();
  TextEditingController _inputNameController = TextEditingController();
  DropdownController _inputTypeController =
      DropdownController(items: TransactionsItems.incomeItems);
  DateController _dateController = DateController();

  FocusNode _incomeFocusNode = FocusNode();
  FocusNode _inputTypeFocusNode = FocusNode();
  FocusNode _inputNameFocusNode = FocusNode();
  FocusNode _datePickerFocusNode = FocusNode();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _incomeController =
        TextEditingController(text: widget.data?.value.toString());
    _inputNameController =
        TextEditingController(text: widget.data?.description);
    _dateController.date = widget.data?.createAt ?? DateTime.now();
    _inputTypeController.value = TransactionsItems.incomeItems
        .where((element) => element.value == "Dinheiro")
        .first;
  }

  late TransactionModel _newData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWithDrawer(title: "Entrada"),
      drawer: DrawerWidget(),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Container(
          height: 480,
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
                  height: 450,
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
                            focusNode: _incomeFocusNode,
                            controller: _incomeController,
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
                                "Tipo de entrada",
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
                                },
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          child: CustomTextField(
                            hintText: "Nome da entrada",
                            labelText: "Nome da entrada",
                            keyboardType: TextInputType.text,
                            focusNode: _inputNameFocusNode,
                            controller: _inputNameController,
                            validator: (value) =>
                                Validators().validateName(value!),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 12,
                          ),
                          child: DatePickerWidget(
                            date: _dateController.date,
                            controller: _dateController,
                            focusNode: _datePickerFocusNode,
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
                  onPressed: () async {
                    FocusScope.of(context).unfocus();
                    if (_formKey.currentState!.validate()) {
                      _newData = TransactionModel(
                        value: double.parse(_incomeController.value.text),
                        type: TypeTransaction.input,
                        category: _inputTypeController.value!.value,
                        description: _inputNameController.value.text,
                        createAt: _dateController.date,
                        updateAt: _dateController.date,
                        uuid: '31KaO9IFxTOY3No1kWfoYyHptiw2',
                      );
                      print('DATA ${_newData.toMap()}');

                      // final bool isSentToDatabase = true;
                      final bool isSentToDatabase =
                          await store.createTransaction(transaction: _newData);

                      if (isSentToDatabase) {
                        final List<TransactionModel> list =
                            Modular.get<TransactionsStore>().transactions;
                        list.add(_newData);
                        Modular.to.pop();

                        showDialog(
                          context: context,
                          builder: (_) => DialogWidget(
                            message: "Dado enviado com sucesso",
                          ),
                        );
                      }
                    }
                    // store.repository.deleteTransaction("jeH1WD8NeFDTcPiC57XU");
                    store.repository.showTransactions();
                    store.repository.showDocs();
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
