import '../repository/transactions_repository.dart';
import '../models/transaction_model.dart';

class TransactionsController {
  late final TransactionsRepository repository;

  Future<bool> createTransaction({
    TransactionModel? transaction,
  }) async {
    return await repository.createTransaction(transaction!);
  }
}
