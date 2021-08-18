import 'package:budget/src/shared/models/models.dart';

abstract class ITransactionsRepository {
  Future<void> createTransaction(TransactionModel transaction);
  Future<void> updateTransaction(TransactionModel transaction, String docId);
  Future<void> deleteTransaction(String uuid);
  Future<List<TransactionModel>> getTransactionsByMonth(int month);
  Future<void> showTransactions();
  Future<void> showDocs();
}
