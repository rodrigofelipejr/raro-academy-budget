import 'package:mobx/mobx.dart';

import '../../../../../shared/errors/failure.dart';
import '../../../../../shared/models/models.dart';
import '../../../../../shared/stores/stores.dart';
import '../../../../../shared/utils/utils.dart';
import '../../../errors/errors.dart';
import '../../../repositories/repositories.dart';
import '../daily_state.dart';

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
      final List<TransactionModel> transactions = await repository.getDaily(
        uuid: authStore.user!.uuid,
        month: state.date.month,
      );

      final input = transactions
          .where((transaction) => transaction.type == TypeTransaction.input)
          .map((e) => e.value)
          .reduce((p, c) => p + c);

      final output = transactions
          .where((transaction) => transaction.type == TypeTransaction.output)
          .map((e) => e.value)
          .reduce((p, c) => p + c);

      setOnError(null);
      setState(
        state.copyWith(
          dailyBalance: (input - output),
          inputs: input,
          outputs: output,
        ),
      );
    } catch (e) {
      setOnError(DailyError(message: e.toString()));
    }
  }
}
