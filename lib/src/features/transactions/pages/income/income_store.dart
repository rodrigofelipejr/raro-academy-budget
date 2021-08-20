import '../../../../shared/models/models.dart';
import '../../repositories/repositories.dart';

class IncomeStore {
  final TransactionsRepository _repository;

  IncomeStore(this._repository);

  Future<bool> createTransaction({required TransactionModel transaction}) async {
    try {
      await _repository.createTransaction(transaction);
      return true;
    } catch (e) {
      return false;
    }
  }
}
