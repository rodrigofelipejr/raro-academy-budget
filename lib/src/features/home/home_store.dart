import 'package:budget/src/shared/utils/utils.dart';
import 'package:mobx/mobx.dart';

import 'home_state.dart';
import 'repositories/home_repository.dart';
import 'errors/errors.dart';

part 'home_store.g.dart';

class HomeStore = _HomeStoreBase with _$HomeStore;

abstract class _HomeStoreBase with Store {
  final HomeRepository repository;

  _HomeStoreBase(this.repository);

  DateTime _now = DateTime.now();

  @observable
  HomeState state = HomeState();
  @action
  void setState(HomeState value) => state = value;

  @observable
  bool isLoading = true;
  @action
  void setIsLoading(bool value) => isLoading = value;

  @observable
  Failure? onError;
  @action
  void setOnError(Failure? value) => onError = value;

  Future<void> init() async {
    setIsLoading(true);
    try {
      final generalBalance = await repository.getGeneralBalance();
      final dailyModel = await repository.getDaily(_now.month);
      final lastTransactions = await repository.getLastTransactions();

      final newState = state.copyWith(
        generalBalance: generalBalance.balance,
        dailyBalance: (dailyModel.input - dailyModel.output),
        inputs: dailyModel.input,
        outputs: dailyModel.output,
        selectedMonth: Dates.descriptionMonth(_now.month).substring(0, 3),
        transactions: lastTransactions,
      );

      setState(newState);
    } catch (e) {
      setOnError(InternalError(message: e.toString())); //TODO - refactor
    } finally {
      setIsLoading(false);
    }
  }
}
