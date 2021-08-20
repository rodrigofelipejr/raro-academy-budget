import 'package:intl/intl.dart';

class DateController {
  DateTime date;

  DateController() : date = DateTime.now();

  String toString() {
    return DateFormat("dd/MM/yyyy").format(date);
  }
}
