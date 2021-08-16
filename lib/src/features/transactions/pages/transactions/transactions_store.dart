import 'package:budget/src/features/transactions/repositories/transaction_repository_interface.dart';
import 'package:budget/src/shared/models/models.dart';
import 'package:mobx/mobx.dart';

part 'transactions_store.g.dart';

class TransactionsStore = _TransactionsStoreBase with _$TransactionsStore;

abstract class _TransactionsStoreBase with Store {
  final ITransactionsRepository repository;

  _TransactionsStoreBase(this.repository) {
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
