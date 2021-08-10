import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'text_styles.dart';

class DatePickerWidget extends StatefulWidget {
  DatePickerWidget({
    Key? key,
    this.controller,
  }) : super(key: key);

  final TextEditingController? controller;

  @override
  _DatePickerWidgetState createState() => _DatePickerWidgetState();
}

class _DatePickerWidgetState extends State<DatePickerWidget> {
  DateTime? selectedDate;

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
      widget.controller!.text = DateFormat("dd/MM/yyyy").format(selectedDate!);
      setState(() {});
    }
  }

  @override
  void initState() {
    widget.controller!.text = DateFormat("dd/MM/yyyy").format(DateTime.now());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        _selectDate(context);
      },
      child: TextFormField(
        controller: widget.controller!,
        enabled: false,
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
