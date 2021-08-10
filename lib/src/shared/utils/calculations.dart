class Calculations {
  static int divide(num a, num b) {
    try {
      return a ~/ b;
    } catch (e) {
      return 0;
    }
  }
}
