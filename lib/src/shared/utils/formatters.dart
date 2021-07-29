import 'package:intl/intl.dart';

class Formatters {
  static String formatMoney(double value) {
    final currency = new NumberFormat("#,##0.00", "pt_BR");
    return currency.format(value);
  }
}
