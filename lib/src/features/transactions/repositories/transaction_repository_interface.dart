import 'package:budget/src/shared/models/models.dart';

abstract class ITransactionsRepository {
  Future<bool> createTransaction(TransactionModel transaction);
  Future<bool> updateTransactions(TransactionModel transaction);
  Future<bool> deleteTransactions(String uuid);
  Future<List<TransactionModel>> getTransactions(int month);
}
