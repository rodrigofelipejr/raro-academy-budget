import 'package:flutter/material.dart';
import 'package:flutter_finance_controller/src/features/income/text_styles.dart';
import 'package:intl/intl.dart';

class DatePickerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now().subtract(Duration(days: 365 * 120)),
        lastDate: DateTime.now().add(Duration(days: 365 * 120)),
      ),
      child: Text(
        DateFormat("dd/MM/yyyy").format(DateTime.now()).toString(),
        style: TextStyles.blue14w500Roboto,
      ),
    );
  }
}
