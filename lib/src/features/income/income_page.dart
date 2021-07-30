import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(189),
        child: Container(
          height: 189,
          color: Colors.blue,
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: 49,
                  bottom: 115,
                  left: 16,
                  right: 319,
                ),
                child: IconButton(
                  icon: Icon(Icons.menu),
                  color: Colors.white,
                  iconSize: 25,
                  onPressed: () {},
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 95,
                  bottom: 62,
                ),
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Entrada",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 26,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w700,
                      letterSpacing: 0.25,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(
          top: 16,
          left: 16,
          right: 16,
          bottom: 40,
        ),
        child: Card(
          color: Colors.yellow,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(7.0),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomTextField(
                  hintText: "Valor em R\$",
                  labelText: "Valor",
                  focusNode: _incomeFocusNode,
                ),
                CustomTextField(
                  hintText: "Tipo de entrada",
                  labelText: "Tipo de entrada",
                  focusNode: _inputTypeFocusNode,
                ),
                CustomTextField(
                  hintText: "Nome da entrada",
                  labelText: "Nome da entrada",
                  focusNode: _inputNameFocusNode,
                ),
                TextButton(
                  onPressed: () => showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(1900),
                    lastDate: DateTime(2050),
                  ),
                  child: Text(
                    DateFormat("dd/MM/yyyy").format(DateTime.now()).toString(),
                    style: TextStyle(
                      fontFamily: "Roboto",
                      fontWeight: FontWeight.w500,
                      fontSize: 14.0,
                      letterSpacing: 0.4,
                      color: Colors.purple,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
