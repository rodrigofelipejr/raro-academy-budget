import 'package:budget/src/features/transactions/models/transaction_model.dart';
import 'package:budget/src/features/transactions/repositories/transactions_repository.dart';

class IncomeController {
  final TransactionsRepository repository;

  IncomeController(this.repository);

  Future<bool> createTransaction({
    TransactionModel? transaction,
  }) async {
    return await repository.createTransaction(transaction!);
  }
}
