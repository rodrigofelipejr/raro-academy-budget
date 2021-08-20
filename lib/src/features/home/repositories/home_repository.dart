import '../../../shared/models/models.dart';
import '../models/models.dart';

abstract class HomeRepository {
  Future<GeneralBalanceModel> getGeneralBalance(String uuid);
  Future<DailyModel> getDaily({required String uuid, required int month});
  Future<List<TransactionModel>> getLastTransactionsByUuid(String uuid);
}
