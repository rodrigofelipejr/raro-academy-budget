import '../../../shared/models/models.dart';

abstract class HomeRepository {
  Future<List<TransactionModel>> getDaily({required String uuid, required int month});
  Future<List<TransactionModel>> getLastTransactionsByUuid(String uuid);
  Future<List<TransactionModel>> getTransactionsByUuid(String uuid);
}
