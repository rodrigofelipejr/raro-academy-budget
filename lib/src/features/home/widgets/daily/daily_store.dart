import 'package:mobx/mobx.dart';

import '../../../../shared/stores/stores.dart';
import '../../../../shared/utils/utils.dart';
import '../../errors/errors.dart';
import '../../repositories/repositories.dart';
import 'daily_state.dart';

part 'daily_store.g.dart';

class DailyStore = _DailyStoreBase with _$DailyStore;

abstract class _DailyStoreBase extends BaseStore with Store {
  final HomeRepository repository;
  final AuthStore authStore;

  _DailyStoreBase(this.repository, this.authStore);

  @observable
  DailyState state = DailyState(date: DateTime.now());
  @action
  void setState(DailyState value) => state = value;

  @observable
  Failure? onError;
  @action
  void setOnError(Failure? value) => onError = value;

  @computed
  String get selectedMonthDescription => Dates.descriptionMonth(state.date.month).substring(0, 3);

  @override
  Future<void> init() async {
    await handleDaily();
  }

  Future<void> handleDaily({DateTime? date}) async {
    if (date != null) {
      setState(state.copyWith(date: date));
    }

    try {
      final dailyModel = await repository.getDaily(uuid: authStore.user!.uuid, month: state.date.month);
      setOnError(null);
      setState(
        state.copyWith(
          dailyBalance: (dailyModel.input - dailyModel.output),
          inputs: dailyModel.input,
          outputs: dailyModel.output,
        ),
      );
    } catch (e) {
      setOnError(DailyError(message: e.toString()));
    }
  }
}
