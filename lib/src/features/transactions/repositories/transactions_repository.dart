import '../../../shared/models/models.dart';

abstract class TransactionsRepository {
  Future<void> createTransaction(TransactionModel transaction);
  Future<void> updateTransaction({
    required String docId,
    required TransactionModel transaction,
  });
  Future<void> deleteTransaction(String docId);
  Future<List<TransactionModel>> getTransactionsByUuid(String uuid);
  Future<List<TransactionModel>> getAllTransactionsByMonth({required String uuid, required int month});
}
