import 'package:budget/src/shared/utils/utils.dart';
import 'package:mobx/mobx.dart';

import 'home_state.dart';
import '../repositories/home_repository.dart';
import '../errors/errors.dart';

part 'home_store.g.dart';

class HomeStore = _HomeStoreBase with _$HomeStore;

abstract class _HomeStoreBase with Store {
  final HomeRepository repository;

  _HomeStoreBase(this.repository);

  @observable
  HomeState state = HomeState(selectedDate: DateTime.now());
  @action
  void setState(HomeState value) => state = value;

  @observable
  bool isLoading = false;
  @action
  void setIsLoading(bool value) => isLoading = value;

  @observable
  Failure? onError;
  @action
  void setOnError(Failure? value) => onError = value;

  @computed
  String get selectedMonthDescription => Dates.descriptionMonth(state.selectedDate.month).substring(0, 3);

  Future<void> init() async {
    setIsLoading(true);

    try {
      final generalBalance = await repository.getGeneralBalance();
      final dailyModel = await repository.getDaily(state.selectedDate.month);
      final lastTransactions = await repository.getLastTransactions();

      final newState = state.copyWith(
        generalBalance: generalBalance.balance,
        dailyBalance: (dailyModel.input - dailyModel.output),
        inputs: dailyModel.input,
        outputs: dailyModel.output,
        transactions: lastTransactions,
      );

      setState(newState);
    } catch (e) {
      //TODO - refactor
      setOnError(InternalError(message: e.toString()));
    } finally {
      setIsLoading(false);
    }
  }

  Future<void> handleChangeMonthSelected(DateTime selectedDate) async {
    setIsLoading(true);
    setState(state.copyWith(selectedDate: selectedDate));
    try {
      final dailyModel = await repository.getDaily(state.selectedDate.month);

      final newState = state.copyWith(
        dailyBalance: (dailyModel.input - dailyModel.output),
        inputs: dailyModel.input,
        outputs: dailyModel.output,
      );

      setState(newState);
    } catch (e) {
      setOnError(DailyError(message: e.toString()));
    } finally {
      setIsLoading(false);
    }
  }
}
