extension StringExtension on String {
  String firstName() {
    return this.split(' ').first;
  }

  String capitalize() {
    return this[0].toUpperCase() + this.substring(1).toLowerCase();
  }
}
