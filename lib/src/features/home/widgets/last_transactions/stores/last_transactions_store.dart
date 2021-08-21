import 'package:mobx/mobx.dart';

import '../../../../../shared/stores/stores.dart';
import '../../../errors/errors.dart';
import '../../../repositories/repositories.dart';
import '../last_transactions_state.dart';

part 'last_transactions_store.g.dart';

class LastTransactionsStore = _LastTransactionsStoreBase with _$LastTransactionsStore;

abstract class _LastTransactionsStoreBase extends BaseStore with Store {
  final HomeRepository repository;
  final AuthStore authStore;

  _LastTransactionsStoreBase(this.repository, this.authStore);

  @observable
  LastTransactionsState state = LastTransactionsState();
  @action
  void setState(LastTransactionsState value) => state = value;

  @observable
  Failure? onError;
  @action
  void setOnError(Failure? value) => onError = value;

  Future<void> init() async {
    await handleTransactions();
  }

  Future<void> handleTransactions() async {
    try {
      final transactions = await repository.getLastTransactionsByUuid(authStore.user!.uuid);
      setOnError(null);
      setState(state.copyWith(transactions: transactions));
    } catch (e) {
      setOnError(LastTransactionError(message: e.toString()));
    } finally {}
  }
}
