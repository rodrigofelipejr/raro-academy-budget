import 'package:budget/src/features/daily/models/transaction_model.dart';

abstract class IDailyRepository {
  Stream<List<TransactionDailyModel>> getTransaction();
}
