import '../../repositories/repositories.dart';
import '../../../../shared/models/models.dart';

class ExpensesStore {
  final TransactionsRepository _repository;

  ExpensesStore(this._repository);

  Future<bool> createTransaction(TransactionModel transaction) async {
    try {
      await _repository.createTransaction(transaction);
      return true;
    } catch (e) {
      return false;
    }
  }
}
