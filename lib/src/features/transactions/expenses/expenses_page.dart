import 'package:budget/src/shared/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

import '../widgets/appbar_with_drawer.dart';
import '../widgets/button_widget.dart';
import '../widgets/date_picker_widget.dart';
import '../widgets/dropdown_buttom_widget.dart';
import '../widgets/dropdown_item_data.dart';
import '../widgets/text_styles.dart';
import '/src/shared/constants/app_colors.dart';

class ExpensesPage extends StatefulWidget {
  const ExpensesPage({Key? key}) : super(key: key);

  @override
  _ExpensesPageState createState() => _ExpensesPageState();
}

class _ExpensesPageState extends State<ExpensesPage> {
  FocusNode _expensesFocusNode = FocusNode();
  FocusNode _inputTypeFocusNode = FocusNode();

  DropdownItemData? dropdownValue;

  final List<DropdownItemData> list = [
    DropdownItemData(
      color: AppColors.amarelo,
      value: "Refeição",
    ),
    DropdownItemData(
      color: AppColors.verde,
      value: "Transporte",
    ),
    DropdownItemData(
      color: AppColors.rosa,
      value: "Viagem",
    ),
    DropdownItemData(
      color: AppColors.azul,
      value: "Educação",
    ),
    DropdownItemData(
      color: AppColors.roxo,
      value: "Pagamentos",
    ),
    DropdownItemData(
      color: AppColors.roxo.withOpacity(0.54),
      value: "Outros",
    ),
  ];

  @override
  Widget build(BuildContext context) {
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
                              value: dropdownValue,
                              items: list,
                              focusNode: _inputTypeFocusNode,
                              onChanged: (newValue) {
                                setState(() {
                                  dropdownValue = newValue as DropdownItemData;
                                });
                              }),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 12,
                        bottom: 97,
                      ),
                      child: DatePickerWidget(),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 345,
              ),
              child: Align(
                alignment: Alignment.center,
                child: ButtonWidget(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
