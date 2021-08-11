import 'package:budget/src/shared/models/models.dart';

abstract class IDailyRepository {
  Future<List<TransactionModel>> getTransactions();
}
