import 'package:mobx/mobx.dart';

import '../../../../shared/stores/stores.dart';
import '../../errors/errors.dart';
import '../../repositories/home_repository.dart';
import 'general_balance_state.dart';

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
    try {
      final generalBalance = await repository.getGeneralBalance(uuid: authStore.user!.uuid);
      setOnError(null);
      setState(state.copyWith(value: generalBalance.balance));
    } catch (e) {
      setOnError(GeneralBalanceError(message: e.toString()));
    }
  }
}
