import 'package:flutter/material.dart';
import 'package:flutter_finance_controller/src/features/income/appbar_with_drawer.dart';
import 'package:flutter_finance_controller/src/features/income/button_widget.dart';
import 'package:flutter_finance_controller/src/features/income/date_picker_widget.dart';
import 'package:flutter_finance_controller/src/features/income/dropdown_buttom_widget.dart';
import 'package:flutter_finance_controller/src/features/income/dropdown_item_data.dart';
import 'package:flutter_finance_controller/src/features/income/text_styles.dart';
import 'package:flutter_finance_controller/src/shared/widget/custom_text_field.dart';

class IncomePage extends StatefulWidget {
  const IncomePage({Key? key}) : super(key: key);

  @override
  _IncomePageState createState() => _IncomePageState();
}

class _IncomePageState extends State<IncomePage> {
  FocusNode _incomeFocusNode = FocusNode();
  FocusNode _inputTypeFocusNode = FocusNode();
  FocusNode _inputNameFocusNode = FocusNode();

  DropdownItemData? dropdownValue;

  final List<DropdownItemData> list = [
    DropdownItemData(
      color: Colors.blue,
      value: "Dinheiro",
    ),
    DropdownItemData(
      color: Colors.blue,
      value: "Pix",
    ),
    DropdownItemData(
      color: Colors.blue,
      value: "Doc",
    ),
    DropdownItemData(
      color: Colors.blue,
      value: "Ted",
    ),
    DropdownItemData(
      color: Colors.blue,
      value: "Boleto",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWithDrawer(),
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
                        focusNode: _incomeFocusNode,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Tipo de entrada",
                            style: TextStyles.blue12w400RobotoOp54,
                          ),
                          DropdownButtomWidget(
                            value: dropdownValue,
                            items: list,
                            focusNode: _inputTypeFocusNode,
                            onChanged: (newValue) {
                              setState(() {
                                dropdownValue = newValue as DropdownItemData;
                              });
                            }
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      child: CustomTextField(
                        hintText: "Nome da entrada",
                        labelText: "Nome da entrada",
                        focusNode: _inputNameFocusNode,
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
                top: 429,
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
