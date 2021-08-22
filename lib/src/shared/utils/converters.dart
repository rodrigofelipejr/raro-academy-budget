class Converters {
  static double parseMoneyFromFirebase(int? value) {
    return value != null ? value.toDouble() / 100 : 0.0;
  }

  static int parseDoubleToIntWithDecimals(double? value) {
    if (value != null) {
      String number = value.toStringAsFixed(2).split('.')[0];
      String decimals = value.toStringAsFixed(2).split('.')[1];
      String intNumber = "$number$decimals";
      return int.parse(intNumber);
    }
    return 0;
  }
}
