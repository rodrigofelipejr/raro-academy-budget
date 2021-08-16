import '../repositories/transactions_repository.dart';
import '../models/transaction_model.dart';

class TransactionsController {
   final TransactionsRepository repository;

  TransactionsController(this.repository);

  Future<bool> createTransaction({
    TransactionModel? transaction,
  }) async {
    return await repository.createTransaction(transaction!);
  }
}
