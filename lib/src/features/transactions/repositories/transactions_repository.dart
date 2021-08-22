import '../../../shared/models/models.dart';

abstract class TransactionsRepository {
  Future<String> createTransaction(TransactionModel transaction);
  Future<void> updateTransaction(TransactionModel transaction);
  Future<void> deleteTransaction(String docId);
  Future<List<TransactionModel>> getTransactionsByUuid(String uuid);
  Future<List<TransactionModel>> getAllTransactionsByMonth({required String uuid, required int month});
  Future<void> showTransactions();
  Future<void> showDocs();
}
