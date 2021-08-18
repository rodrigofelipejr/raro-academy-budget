import 'package:budget/src/features/home/home.dart';
import 'package:budget/src/features/transactions/repositories/transaction_repository_interface.dart';
import 'package:budget/src/shared/models/models.dart';
import 'package:mobx/mobx.dart';

import 'errors/erros.dart';

part 'transactions_store.g.dart';

class TransactionsStore = _TransactionsStoreBase with _$TransactionsStore;

abstract class _TransactionsStoreBase with Store {
  final ITransactionsRepository repository;
  final HomeStore homeStore;

  _TransactionsStoreBase(this.repository, this.homeStore) {
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

  @observable
  bool isLoading = false;
  @action
  void setIsLoading(bool value) => isLoading = value;

  @observable
  Failure? onError;
  @action
  void setOnError(Failure? value) => onError = value;

  Future<void> handleGetTransaction() async {
    setIsLoading(true);
    try {
      final month = homeStore.dailyStore.state.date.month;
      final data = await repository.getTransactionsByMonth(month);
      setOnError(null);

      setTransactions(data);
      setIndexPage(0);
      setIsLoading(false);
    } catch (e) {
      setIsLoading(false);
      setOnError(TransActionError(message: e.toString()));
    }
  }
}
