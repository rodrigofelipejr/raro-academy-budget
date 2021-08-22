extension StringExtension on String {
  String firstName() {
    return this.split(' ').first;
  }

  String capitalize() {
    return this[0].toUpperCase() + this.substring(1).toLowerCase();
  }

  String onlyNumbers() {
    return this.replaceAll(new RegExp(r'[^0-9]'), '');
  }
}
