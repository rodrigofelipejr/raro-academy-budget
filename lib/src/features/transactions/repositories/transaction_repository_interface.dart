import 'package:budget/src/shared/models/models.dart';

abstract class ITransactionsRepository {
  Future<void> createTransaction(TransactionModel transaction);
  Future<void> updateTransaction(TransactionModel transaction, String docId);
  Future<void> deleteTransaction(String uuid);
  Future<List<TransactionModel>> getTransactions();
  Future<List<TransactionModel>> getTransactionsByMonth({required String uuid ,required int month});
  Future<void> showTransactions();
  Future<void> showDocs();
}
