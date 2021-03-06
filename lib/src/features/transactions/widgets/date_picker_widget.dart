import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../controller/date_controller.dart';
import 'text_styles.dart';

class DatePickerWidget extends StatefulWidget {
  final DateTime? date;
  final DateController controller;
  final FocusNode? focusNode;

  DatePickerWidget({
    Key? key,
    required this.controller,
    this.focusNode,
    this.date,
  }) : super(key: key);

  @override
  _DatePickerWidgetState createState() => _DatePickerWidgetState();
}

class _DatePickerWidgetState extends State<DatePickerWidget> {
  DateTime? selectedDate;
  String? selectedDateToString;
  TextEditingController textController = TextEditingController();

  Future<Null> _selectDate(BuildContext context) async {
    final DateTime? newDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      initialDatePickerMode: DatePickerMode.day,
      firstDate: DateTime.now().subtract(Duration(days: 365 * 120)),
      lastDate: DateTime.now().add(Duration(days: 365 * 120)),
    );
    if (newDate != null) {
      selectedDate = newDate;

      widget.controller.date = selectedDate!;
      textController.text = DateFormat("dd/MM/yyyy").format(selectedDate!);
      setState(() {});
    }
  }

  @override
  void initState() {
    textController.text = DateFormat("dd/MM/yyyy").format(widget.date ?? DateTime.now());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        _selectDate(context);
      },
      child: TextFormField(
        controller: textController,
        enabled: false,
        focusNode: widget.focusNode,
        keyboardType: TextInputType.datetime,
        style: TextStyles.blue14w500Roboto,
        decoration: InputDecoration(
          disabledBorder: UnderlineInputBorder(
            borderSide: BorderSide.none,
          ),
          contentPadding: const EdgeInsets.only(left: 8),
        ),
      ),
    );
  }
}
