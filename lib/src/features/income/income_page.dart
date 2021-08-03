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

  // DropDownItemData? dropdownValue;

  DropDownItemData? dropdownValue = DropDownItemData(
    color: Colors.blue,
    value: "Pix",
  );

  final List<DropDownItemData> list = [
    DropDownItemData(
      color: Colors.blue,
      value: "Dinheiro",
    ),
    DropDownItemData(
      color: Colors.blue,
      value: "Pix",
    ),
    DropDownItemData(
      color: Colors.blue,
      value: "Doc",
    ),
    DropDownItemData(
      color: Colors.blue,
      value: "Ted",
    ),
    DropDownItemData(
      color: Colors.blue,
      value: "Boleto",
    ),
  ];

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
                            style: TextStyle(
                              color: Colors.blue.withOpacity(0.54),
                              fontFamily: 'roboto',
                              fontSize: 12,
                              fontWeight: FontWeight.normal,
                              letterSpacing: 0.15,
                            ),
                          ),
                          DropdownButton<String>(
                            isExpanded: true,
                            hint: Container(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 12.0),
                              child: Text(
                                "Escolha",
                                style: TextStyle(
                                  fontFamily: 'roboto',
                                  color: Colors.blue.withOpacity(0.54),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  letterSpacing: 0.15,
                                ),
                              ),
                            ),
                            value: dropdownValue!.value,
                            icon: const Icon(Icons.arrow_drop_down),
                            iconSize: 24,
                            elevation: 8,
                            style: TextStyle(
                              color: Colors.blue.withOpacity(0.54),
                              fontFamily: 'roboto',
                              fontSize: 16,
                              fontWeight: FontWeight.normal,
                              letterSpacing: 0.15,
                            ),
                            underline: Container(
                              height: 1,
                              color: Colors.blue.withOpacity(0.42),
                            ),
                            onChanged: (newValue) {
                              setState(() {
                                dropdownValue = newValue as DropDownItemData;
                              });
                            },
                            focusNode: _inputTypeFocusNode,
                            selectedItemBuilder: (BuildContext context) {
                              return list.map<DropdownMenuItem<String>>(
                                  (DropDownItemData item) {
                                return DropdownMenuItem<String>(
                                  value: item.value,
                                  child: Text(
                                    item.value,
                                    style: TextStyle(
                                      fontFamily: 'roboto',
                                      color: Colors.blue.withOpacity(0.54),
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      letterSpacing: 0.15,
                                    ),
                                  ),
                                );
                              }).toList();
                            },
                            items: list.map<DropdownMenuItem<String>>(
                                (DropDownItemData item) {
                              return DropdownMenuItem<String>(
                                value: item.value,
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(right: 12.0),
                                      height: 24.0,
                                      width: 24.0,
                                      decoration: BoxDecoration(
                                        color: Colors.blue,
                                        shape: BoxShape.circle,
                                      ),
                                    ),
                                    Text(
                                      item.value,
                                      style: TextStyle(
                                        fontFamily: 'roboto',
                                        color: Colors.blue.withOpacity(0.87),
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                        letterSpacing: 0.15,
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            }).toList(),
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
                      child: TextButton(
                        onPressed: () => showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(1900),
                          lastDate: DateTime(2050),
                        ),
                        child: Text(
                          DateFormat("dd/MM/yyyy")
                              .format(DateTime.now())
                              .toString(),
                          style: TextStyle(
                            fontFamily: "Roboto",
                            fontWeight: FontWeight.w500,
                            fontSize: 14.0,
                            letterSpacing: 0.4,
                            color: Colors.blue,
                          ),
                        ),
                      ),
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
                child: Container(
                  width: 123,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.all(
                      Radius.circular(24.0),
                    ),
                  ),
                  child: IconButton(
                    onPressed: () {},
                    icon: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Icon(
                          Icons.add,
                          color: Colors.white,
                          semanticLabel: "INSERIR",
                        ),
                        Text(
                          "INSERIR",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 0.46,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DropDownItemData {
  final Color color;
  final String value;

  DropDownItemData({
    required this.color,
    required this.value,
  });

  set color(Color color) => color = color;

  set value(String value) => value = value;
}
