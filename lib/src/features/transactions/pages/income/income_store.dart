import 'package:budget/src/features/transactions/repositories/transactions_repository.dart';
import 'package:budget/src/shared/models/models.dart';

class IncomeStore {
  final TransactionsRepository repository;

  IncomeStore(this.repository);

  Future<bool> createTransaction({
    required TransactionModel transaction,
  }) async {
    try {
      await repository.createTransaction(transaction);
      return true;
    } catch (e) {
      return false;
    }
  }
}
