import '../repository/transactions_repository.dart';
import '../models/transaction_data.dart';

class TransactionsController {
  late final TransactionsRepository repository;

  Future<bool> createTransaction({
    TransactionData? transaction,
  }) async {
    return await repository.createTransaction(transaction!);
  }
}
