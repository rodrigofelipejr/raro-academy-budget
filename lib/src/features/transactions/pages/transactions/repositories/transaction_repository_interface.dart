import 'package:budget/src/shared/models/models.dart';

abstract class ITransactionsRepository {
  Future<List<TransactionModel>> getTransactions();
}
