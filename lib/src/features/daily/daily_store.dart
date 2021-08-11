import 'package:budget/src/features/daily/repositories/daily_repository_interface.dart';
import 'package:budget/src/shared/models/models.dart';
import 'package:mobx/mobx.dart';

part 'daily_store.g.dart';

class DailyStore = _DailyStoreBase with _$DailyStore;

abstract class _DailyStoreBase with Store {
  final IDailyRepository repository;

  @observable
  ObservableFuture<List<TransactionModel>>? transactionList;

  _DailyStoreBase(this.repository) {
    getList();
  }

  @action
  getList() {
    transactionList = repository.getTransactions().asObservable();
  }
}
