class Converters {
  static double parseMoneyFromFirebase(int? value) {
    return value != null ? value.toDouble() / 100 : 0.0;
  }

  static int parseDoubleToIntWithDecimals(double? value) {
    if (value != null) {
      String number = value.toString().split('.')[0];
      String decimals = value.toString().split('.')[1];
      String intNumber = "$number$decimals";
      return int.parse(intNumber);
    }
    return 0;
  }
}
