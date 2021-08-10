class TransactionModel {
  int category;
  DateTime date;
  String description;
  int type;
  int value;

  TransactionModel(
      {required this.category,
      required this.date,
      required this.description,
      required this.type,
      required this.value});
}
