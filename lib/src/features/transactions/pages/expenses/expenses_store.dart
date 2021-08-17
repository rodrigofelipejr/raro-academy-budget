import 'package:budget/src/features/transactions/repositories/transactions_repository.dart';
import 'package:budget/src/shared/models/models.dart';

class ExpensesStore {
  final TransactionsRepository repository;

  ExpensesStore(this.repository);

  Future<bool> createTransaction({
    TransactionModel? transaction,
  }) async {
    return await repository.createTransaction(transaction!);
  }
}
