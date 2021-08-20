import 'package:budget/src/shared/models/models.dart';

abstract class ITransactionsRepository {
  Future<String?> createTransaction(TransactionModel transaction);
  Future<void> updateTransaction(TransactionModel transaction);
  Future<void> deleteTransaction(TransactionModel transaction);
  Future<List<TransactionModel>> getTransactions(String uuid);
  Future<List<TransactionModel>> getTransactionsByMonth({required String uuid ,required int month});
  Future<void> showTransactions();
  Future<void> showDocs();
}
