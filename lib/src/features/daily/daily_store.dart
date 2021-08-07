import '../../shared/models/models.dart';

class DailyController {
  double generalBalance = 12233;
  double dailyBalance = 5453;
  double inputs = 9345;
  double outputs = 3892;
  String selectedMonth = 'ago';
  List<TransactionModel> transactions = [
    TransactionModel(
      type: TypeTransaction.input,
      category: CategoryTransaction.meal,
      description: 'Refeição',
      date: DateTime.now(),
      value: 25.00,
    ),
    TransactionModel(
      type: TypeTransaction.output,
      category: CategoryTransaction.transport,
      description: 'Transporte',
      date: DateTime.now(),
      value: 57.30,
    ),
    TransactionModel(
      type: TypeTransaction.output,
      category: CategoryTransaction.education,
      description: 'Educação',
      date: DateTime.now(),
      value: 316.00,
    ),
  ];
}
