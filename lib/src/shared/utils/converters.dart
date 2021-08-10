class Converters {
  static double parseMoneyFromFirebase(int? value) {
    return value != null ? value.toDouble() / 100 : 0.0;
  }
}
