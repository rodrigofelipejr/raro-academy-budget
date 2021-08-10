import 'package:mobx/mobx.dart';
import 'package:budget/src/features/daily/repositories/daily_repository.dart';

// part 'daily_store.g.dart'

// class DailyStore = _DailyStoreBase with _$DailyStore;

abstract class _DailyStoreBase with Store {
  final DailyRepository repository;

  _DailyStoreBase(this.repository);
}
