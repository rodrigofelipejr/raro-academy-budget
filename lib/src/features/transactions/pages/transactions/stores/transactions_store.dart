import 'package:mobx/mobx.dart';

import '../../../../../shared/models/models.dart';
import '../../../../../shared/stores/stores.dart';
import '../../../../features.dart';
import '../../../repositories/repositories.dart';
import '../errors/erros.dart';

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
  void setTransactions({List<TransactionModel>? values, TransactionModel? value}) {
    if (values != null) {
      transactions.clear();
      transactions.addAll(values);
    }

    if (value != null) {
      transactions.add(value);
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
      // final data = await repository.getTransactionsByMonth(uuid: authStore.firebaseAuth.currentUser!.uid, month: month);
      final transactions = await repository.getAllTransactionsByMonth(uuid: authStore.user!.uuid, month: month);
      setOnError(null);
      setTransactions(values: transactions);
      setIndexPage(0);
    } catch (e) {
      setOnError(TransActionError(message: e.toString()));
    } finally {
      setIsLoading(false);
    }
  }
}
