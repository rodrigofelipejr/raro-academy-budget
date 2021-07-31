import 'package:intl/intl.dart';

class Formatters {
  static String formatMoney(double value) {
    final currency = new NumberFormat("#,##0.00", "pt_BR");
    return currency.format(value);
  }

  static String dateParsing(DateTime date) {
    var format = DateFormat('dd/MM/yyyy');
    return format.format(date);
  }

  static String dateTimeParsing(DateTime date) {
    var format = DateFormat('dd/MM/yyyy HH:MM:SS');
    return format.format(date);
  }
}
