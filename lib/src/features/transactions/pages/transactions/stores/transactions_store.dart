import 'package:mobx/mobx.dart';

import '../../../../../shared/errors/failure.dart';
import '../../../../../shared/models/models.dart';
import '../../../../../shared/stores/stores.dart';
import '../../../../features.dart';
import '../../../errors/erros.dart';
import '../../../repositories/repositories.dart';

part 'transactions_store.g.dart';

class TransactionsStore = _TransactionsStoreBase with _$TransactionsStore;

abstract class _TransactionsStoreBase extends BaseStore with Store {
  final TransactionsRepository repository;
  final HomeStore homeStore;
  final AuthStore authStore;

  _TransactionsStoreBase(this.repository, this.homeStore, this.authStore);

  @override
  Future<void> init() async {
    await handleGetTransaction();
  }

  @observable
  List<TransactionModel> transactions = ObservableList<TransactionModel>();
  @action
  void setTransactions(
      {List<TransactionModel>? values, TransactionModel? value}) {
    if (values != null) {
      transactions.clear();
      transactions.addAll(values);
    }
 
    if (value != null) {
      if (transactions.contains(value)) {
        final idx = transactions.indexOf(value);
        transactions[idx] = value;
      } else {
        transactions.add(value);
      }
    }
  }

  @computed
  List<TransactionModel> get transactionOutput => transactions
      .where((transaction) => transaction.type.index == 0)
      .where((transaction) =>
          transaction.updateAt.month == homeStore.dailyStore.state.date.month)
      .toList();
  @computed
  List<TransactionModel> get transactionInput => transactions
      .where((transaction) => transaction.type.index == 1)
      .where((transaction) =>
          transaction.updateAt.month == homeStore.dailyStore.state.date.month)
      .toList();
  @computed
  List<TransactionModel> get transactionsByMonth =>
      transactionInput + transactionOutput;
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
      // final month = homeStore.dailyStore.state.date.month;
      final transactions = await repository
          .getTransactionsByUuid(authStore.firebaseAuth.currentUser!.uid);
      setOnError(null);
      setTransactions(values: transactions);
      setIndexPage(0);
    } catch (e) {
      setOnError(TransactionError(message: e.toString()));
    } finally {
      setIsLoading(false);
    }
  }

  Future<bool> deleteTransaction(String docId) async {
    bool deleteSuccess = false;
    setIsLoading(true);
    try {
      await repository.deleteTransaction(docId);
      _deleteLocalTransaction(docId);
      deleteSuccess = true;
    } catch (e) {
      setOnError(DeleteTransactionError(message: e.toString()));
    } finally {
      setIsLoading(false);
    }
    return deleteSuccess;
  }

  void _deleteLocalTransaction(String docId) {
    final updated = transactions.where((transaction) => transaction.id != docId).toList();
    setTransactions(values: updated);
  }
}
