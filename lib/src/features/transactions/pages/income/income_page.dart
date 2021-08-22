// import 'package:budget/src/features/transactions/constants/transactions_items.dart';
// import 'package:budget/src/features/transactions/controller/date_controller.dart';
// import 'package:budget/src/features/transactions/controller/dropdown_controller.dart';
// import 'package:budget/src/features/transactions/pages/income/income_store.dart';
// import 'package:budget/src/features/transactions/pages/transactions/stores/transactions_store.dart';
// import 'package:budget/src/features/transactions/widgets/appbar_with_drawer.dart';
// import 'package:budget/src/features/transactions/widgets/button_widget.dart';
// import 'package:budget/src/features/transactions/widgets/date_picker_widget.dart';
// import 'package:budget/src/features/transactions/widgets/dialog_widget.dart';
// import 'package:budget/src/features/transactions/widgets/dropdown_button_widget.dart';
// import 'package:budget/src/features/transactions/widgets/text_styles.dart';
// import 'package:budget/src/shared/constants/constants.dart';
// import 'package:budget/src/shared/models/models.dart';
// import 'package:budget/src/shared/stores/auth/auth_store.dart';
// import 'package:budget/src/shared/validators/validators.dart';
// import 'package:budget/src/shared/widgets/custom_text_field.dart';
// import 'package:budget/src/shared/widgets/drawer/drawer_widget.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_modular/flutter_modular.dart';

// class IncomePage extends StatefulWidget {
//   const IncomePage({Key? key, this.data}) : super(key: key);
//   final TransactionModel? data;

//   @override
//   _IncomePageState createState() => _IncomePageState();
// }

// class _IncomePageState extends ModularState<IncomePage, IncomeStore> {
//   TextEditingController _incomeController = TextEditingController();
//   TextEditingController _inputNameController = TextEditingController();
//   DropdownController _inputTypeController = DropdownController(items: TransactionsItems.incomeItems);
//   DateController _dateController = DateController();

//   FocusNode _incomeFocusNode = FocusNode();
//   FocusNode _inputTypeFocusNode = FocusNode();
//   FocusNode _inputNameFocusNode = FocusNode();
//   FocusNode _datePickerFocusNode = FocusNode();

//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

//   @override
//   void initState() {
//     super.initState();
//     if (widget.data != null) {
//       print(widget.data.toString());
//       _incomeController = TextEditingController(text: widget.data?.value.toString());
//       _inputNameController = TextEditingController(text: widget.data?.description);
//       _inputTypeController.value =
//           TransactionsItems.incomeItems.firstWhere((item) => item.key == widget.data!.category);
//       _dateController.date = widget.data!.createAt;
//     }
//   }

//   late TransactionModel _newData;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBarWithDrawer(title: "Entrada"),
//       drawer: DrawerWidget(),
//       body: SingleChildScrollView(
//         padding: EdgeInsets.all(16.0),
//         child: Container(
//           height: 480,
//           child: Stack(
//             alignment: Alignment.topCenter,
//             children: [
//               Card(
//                 color: Colors.white,
//                 elevation: 3.0,
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.all(
//                     Radius.circular(7.0),
//                   ),
//                 ),
//                 child: Container(
//                   height: 450,
//                   padding: const EdgeInsets.symmetric(horizontal: 54),
//                   child: Form(
//                     key: _formKey,
//                     child: Column(
//                       mainAxisSize: MainAxisSize.max,
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Padding(
//                           padding: const EdgeInsets.only(
//                             top: 55,
//                             bottom: 12,
//                           ),
//                           child: CustomTextField(
//                             hintText: "Valor",
//                             labelText: "Valor em R\$",
//                             keyboardType: TextInputType.number,
//                             focusNode: _incomeFocusNode,
//                             controller: _incomeController,
//                             validator: (value) => Validators.validateNumber(value!),
//                           ),
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.symmetric(vertical: 12),
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text(
//                                 "Tipo de entrada",
//                                 style: TextStyles.black12w400RobotoOp54,
//                               ),
//                               DropdownButtonWidget(
//                                 value: _inputTypeController.value,
//                                 items: _inputTypeController.items,
//                                 focusNode: _inputTypeFocusNode,
//                                 validator: (value) => Validators.validateTransactionCategory(value?.key),
//                                 onChanged: (newValue) {
//                                   _inputTypeController.value = newValue!;
//                                   setState(() {});
//                                 },
//                               ),
//                             ],
//                           ),
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.symmetric(vertical: 12),
//                           child: CustomTextField(
//                             hintText: "Nome da entrada",
//                             labelText: "Nome da entrada",
//                             keyboardType: TextInputType.text,
//                             focusNode: _inputNameFocusNode,
//                             controller: _inputNameController,
//                             validator: (value) => Validators.validateName(value!),
//                           ),
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.only(
//                             top: 12,
//                           ),
//                           child: DatePickerWidget(
//                             date: _dateController.date,
//                             controller: _dateController,
//                             focusNode: _datePickerFocusNode,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//               Positioned(
//                 bottom: 0,
//                 child: ButtonWidget(
//                   label: "INSERIR",
//                   onPressed: () async {
//                     FocusScope.of(context).unfocus();
//                     if (_formKey.currentState!.validate()) {
//                       _newData = TransactionModel(
//                         uuid: Modular.get<AuthStore>().user!.uuid,
//                         value: double.parse(_incomeController.value.text),
//                         type: TypeTransaction.input,
//                         category: TransactionCategories.input[_inputTypeController.value!.key]!,
//                         description: _inputNameController.value.text,
//                         createAt: _dateController.date,
//                         updateAt: _dateController.date,
//                       );
//                       print('DATA ${_newData.toMap()}');

//                       final String? returnedId;
//                       bool isUpdated = false;
//                       if (widget.data == null) {
//                         returnedId = await store.createTransaction(transaction: _newData);
//                       } else {
//                         _newData = widget.data!.copyWith(
//                           value: double.parse(_incomeController.value.text),
//                           category: TransactionCategories.input[_inputTypeController.value!.key]!,
//                           description: _inputNameController.value.text,
//                           updateAt: _dateController.date,
//                         );
//                         final List<TransactionModel> list = Modular.get<TransactionsStore>().transactions;
//                         list.remove(widget.data!);
//                         list.add(_newData);
//                         await store.updateTransaction(transaction: _newData);
//                         returnedId = null;
//                         isUpdated = true;
//                         Modular.to.pop();
//                       }

//                       if (returnedId != null) {
//                         _newData = _newData.copyWith(id: returnedId);
//                         final List<TransactionModel> list = Modular.get<TransactionsStore>().transactions;
//                         list.add(_newData);
//                         Modular.to.pop();
//                       }

//                       if (returnedId != null || isUpdated) {
//                         showDialog(
//                           context: context,
//                           builder: (_) => DialogWidget(
//                             message: isUpdated ? "Dado atualizado com sucesso" : "Dado enviado com sucesso",
//                           ),
//                         );
//                       }
//                     }
//                     // store.repository.showTransactions();
//                     // store.repository.showDocs();
//                     print(store.authStore.firebaseAuth.currentUser!.uid);
//                     print("TRANSACTIONS STORE");
//                     Modular.get<TransactionsStore>().transactions.forEach((element) => print(element));
//                   },
//                 ),
//               ),
//               ButtonWidget(
//                 onPressed: () async {
//                   bool isDeleted = false;
//                   if (widget.data != null) {
//                     await store.deleteTransaction(transaction: widget.data!);
//                   }
//                   final List<TransactionModel> list = Modular.get<TransactionsStore>().transactions;
//                   list.remove(widget.data!);
//                   isDeleted = true;
//                   Modular.to.pop();

//                   if (isDeleted) {
//                     showDialog(
//                       context: context,
//                       builder: (_) => DialogWidget(message: "Dado removido com sucesso"),
//                     );
//                   }
//                 },
//                 label: "DEL",
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
