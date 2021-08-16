import 'package:mobx/mobx.dart';

import '../../shared/stores/stores.dart';
import 'errors/errors.dart';
import 'widgets/widgets.dart';

part 'home_store.g.dart';

class HomeStore = _HomeStoreBase with _$HomeStore;

abstract class _HomeStoreBase extends BaseStore with Store {
  final GeneralBalanceStore generalBalanceStore;
  final DailyStore dailyStore;
  final LastTransactionsStore lastTransactionsStore;

  _HomeStoreBase(
    this.generalBalanceStore,
    this.dailyStore,
    this.lastTransactionsStore,
  );

  @observable
  bool isLoading = false;
  @action
  void setIsLoading(bool value) => isLoading = value;

  @observable
  Failure? onError;
  @action
  void setOnError(Failure value) => onError = value;

  @override
  Future<void> init() async {
    setIsLoading(true);

    Future.wait([
      generalBalanceStore.init(),
      dailyStore.init(),
      lastTransactionsStore.init(),
      Future.delayed(Duration(seconds: 2)),
    ]).then((_) {}).whenComplete(() => setIsLoading(false));
  }
}
