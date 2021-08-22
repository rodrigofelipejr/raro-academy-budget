import 'package:mobx/mobx.dart';

import '../../../../../shared/errors/failure.dart';
import '../../../../../shared/models/models.dart';
import '../../../../../shared/stores/stores.dart';
import '../../../../features.dart';
import '../../../errors/erros.dart';
import '../../../repositories/repositories.dart';

part 'transactions_list_store.g.dart';

class TransactionsListStore = _TransactionsListStoreBase with _$TransactionsListStore;

abstract class _TransactionsListStoreBase extends BaseStore with Store {
  final TransactionsRepository repository;
  final HomeStore homeStore;
  final AuthStore authStore;

  _TransactionsListStoreBase(this.repository, this.homeStore, this.authStore);

  @override
  Future<void> init() async {
    await handleGetTransaction();
  }

  @observable
  ObservableList<TransactionModel> transactions = ObservableList<TransactionModel>();
  @action
  void setTransactions({List<TransactionModel>? values, TransactionModel? value}) {
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
      final transactions = await repository.getAllTransactionsByMonth(uuid: authStore.user!.uuid, month: month);
      setOnError(null);
      setTransactions(values: transactions);
      setIndexPage(0); //REVIEW - verificar
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
      setOnError(null);
      deleteSuccess = true;
      setIndexPage(0); //REVIEW - verificar
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
