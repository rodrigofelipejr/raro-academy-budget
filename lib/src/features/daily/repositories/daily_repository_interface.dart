import 'package:budget/src/features/daily/models/transaction_model.dart';
import 'package:budget/src/shared/models/models.dart';
import 'package:mobx/mobx.dart';

abstract class IDailyRepository {
  Future<List<TransactionModel>> getTransactions();
}
