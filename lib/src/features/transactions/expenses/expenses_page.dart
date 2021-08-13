import 'package:budget/src/shared/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

import '../widgets/appbar_with_drawer.dart';
import '../widgets/button_widget.dart';
import '../widgets/date_picker_widget.dart';
import '../widgets/dropdown_buttom_widget.dart';
import '../widgets/text_styles.dart';
import '../repository/transactions_repository.dart';
import '../controller/transactions_controller.dart';
import '../controller/date_controller.dart';
import '../controller/dropdown_controller.dart';

class ExpensesPage extends StatefulWidget {
  const ExpensesPage({Key? key}) : super(key: key);

  @override
  _ExpensesPageState createState() => _ExpensesPageState();
}

class _ExpensesPageState extends State<ExpensesPage> {
  TransactionsRepository _repository = TransactionsRepository();

  TransactionsController _controller = TransactionsController();
  DropdownController _inputTypeController = DropdownController();
  DateController _dateController = DateController();

  FocusNode _expensesFocusNode = FocusNode();
  FocusNode _inputTypeFocusNode = FocusNode();
  FocusNode _dateFocusNode = FocusNode();

  @override
  void initState() {
    _controller.repository = _repository;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

    return Scaffold(
      appBar: AppBarWithDrawer(title: "Saída"),
      drawer: Drawer(),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(
          top: 16,
          left: 16,
          right: 16,
          bottom: 40,
        ),
        child: Stack(
          children: [
            Card(
              color: Colors.white,
              elevation: 3.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(7.0),
                ),
              ),
              child: Padding(
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
                          focusNode: _expensesFocusNode,
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
                          bottom: 97,
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
            Padding(
              padding: const EdgeInsets.only(
                top: 345,
              ),
              child: Align(
                alignment: Alignment.center,
                child: ButtonWidget(
                  label: "INSERIR",
                  onPressed: () {},
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
