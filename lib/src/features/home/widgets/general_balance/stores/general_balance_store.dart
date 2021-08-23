import 'package:budget/src/shared/models/models.dart';
import 'package:mobx/mobx.dart';

import '../../../../../shared/errors/failure.dart';
import '../../../../../shared/stores/stores.dart';
import '../../../errors/errors.dart';
import '../../../repositories/repositories.dart';
import '../general_balance_state.dart';

part 'general_balance_store.g.dart';

class GeneralBalanceStore = _GeneralBalanceStoreBase with _$GeneralBalanceStore;

abstract class _GeneralBalanceStoreBase extends BaseStore with Store {
  final HomeRepository repository;
  final AuthStore authStore;

  _GeneralBalanceStoreBase(this.repository, this.authStore);

  @observable
  GeneralBalanceState state = GeneralBalanceState();
  @action
  void setState(GeneralBalanceState value) => state = value;

  @observable
  Failure? onError;
  @action
  void setOnError(Failure? value) => onError = value;

  @observable
  bool visibleBalance = false;
  @action
  void setVisibleBalance(bool value) => visibleBalance = value;

  @override
  Future<void> init() async {
    await handleGeneralBalance();
  }

  Future<void> handleGeneralBalance() async {
    double generalBalance = 0.0;
    double input = 0.0;
    double output = 0.0;

    try {
      final List<TransactionModel> transactions = await repository.getTransactionsByUuid(authStore.user!.uuid);

      if (transactions.isNotEmpty) {
        final inputsFiltered = transactions.where((transaction) => transaction.type == TypeTransaction.input);
        if (inputsFiltered.isNotEmpty) input = inputsFiltered.map((e) => e.value).reduce((p, c) => p + c);

        final outputFiltered = transactions.where((transaction) => transaction.type == TypeTransaction.output);
        if (outputFiltered.isNotEmpty) output = outputFiltered.map((e) => e.value).reduce((p, c) => p + c);

        generalBalance = input - output;
      }

      setOnError(null);
      if (state.value != generalBalance)
        setState(
          state.copyWith(value: generalBalance),
        );
    } catch (e) {
      setOnError(GeneralBalanceError(message: e.toString()));
    }
  }
}
