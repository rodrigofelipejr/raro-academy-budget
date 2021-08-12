import 'package:budget/src/features/daily/repositories/daily_repository_interface.dart';
import 'package:budget/src/shared/models/models.dart';
import 'package:mobx/mobx.dart';

part 'daily_store.g.dart';

class DailyStore = _DailyStoreBase with _$DailyStore;

abstract class _DailyStoreBase with Store {
  final IDailyRepository repository;

  _DailyStoreBase(this.repository) {
    init();
  }

  Future<void> init() async {
    await handleGetTransaction();
  }

  @observable
  List<TransactionModel> transactions = ObservableList<TransactionModel>();
  @action
  void setTransactions(List<TransactionModel> value) {
    transactions.clear();
    transactions.addAll(value);
  }

  @computed
  List<TransactionModel> get transactionOutput =>
      transactions.where((transaction) => transaction.type.index == 0).toList();
  @computed
  List<TransactionModel> get transactionInput =>
      transactions.where((transaction) => transaction.type.index == 1).toList();
  @computed
  double get transactionOutputTotal {
    double sum = 0.0;
    transactionOutput.forEach((transaction) {
      sum += transaction.value;
    });
    return sum;
  }

  @computed
  double get transactionInputTotal {
    double sum = 0.0;
    transactionInput.forEach((transaction) {
      sum += transaction.value;
    });
    return sum;
  }

  @computed
  double get transactionTotal => transactionInputTotal - transactionOutputTotal;

  @observable
  int indexPage = 0;
  @action
  void setIndexPage(int value) => indexPage = value;

  Future<void> handleGetTransaction() async {
    try {
      final data = await repository.getTransactions();
      print(transactions.length);
      setTransactions(data);
      print(transactions.length);
    } catch (e) {
      print("asdasd");
      print(e);
    }
  }
}
