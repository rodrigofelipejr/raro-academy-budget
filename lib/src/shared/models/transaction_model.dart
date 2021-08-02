enum TypeTransaction { input, output }
enum CategoryTransaction { meal, transport, trip, education, payments, others }

class TransactionModel {
  final TypeTransaction type;
  final CategoryTransaction category;
  final String description;
  final DateTime date;
  double value;

  TransactionModel({
    required this.type,
    required this.category,
    required this.description,
    required this.date,
    required this.value,
  });
}
