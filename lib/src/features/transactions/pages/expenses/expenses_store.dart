import 'package:budget/src/features/transactions/repositories/transactions_repository.dart';
import 'package:budget/src/shared/models/models.dart';
import 'package:mobx/mobx.dart';

import '/src/shared/stores/auth/auth_store.dart';
import '/src/shared/stores/stores.dart';

part 'expenses_store.g.dart';

class ExpensesStore = _ExpensesStoreBase with _$ExpensesStore;

abstract class _ExpensesStoreBase extends BaseStore with Store {
  final TransactionsRepository repository;
  final AuthStore authStore;

  _ExpensesStoreBase(this.repository, this.authStore);

  @override
  Future<void> init() async {}

  Future<String?> createTransaction({
    required TransactionModel transaction,
  }) async {
    transaction = transaction.copyWith(uuid: authStore.firebaseAuth.currentUser!.uid);
    try {
      return await repository.createTransaction(transaction);
    } catch (e) {
      return null;
    }
  }

  Future<bool> updateTransaction({
    required TransactionModel transaction,
  }) async {
    transaction = transaction.copyWith(uuid: authStore.firebaseAuth.currentUser!.uid);
    try {
      await repository.updateTransaction(transaction);
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> deleteTransaction({
    required TransactionModel transaction,
  }) async {
    try {
      await repository.deleteTransaction(transaction.id!);
      return true;
    } catch (e) {
      return false;
    }
  }
}
