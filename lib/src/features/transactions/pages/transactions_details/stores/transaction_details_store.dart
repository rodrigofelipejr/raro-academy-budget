import 'package:mobx/mobx.dart';

import '../../../../../shared/errors/failure.dart';
import '../../../../../shared/models/models.dart';
import '../../../../../shared/stores/stores.dart';
import '../../../errors/erros.dart';
import '../../../repositories/repositories.dart';
import '../../../transactions.dart';

part 'transaction_details_store.g.dart';

class TransactionsDetailsStore = _TransactionsDetailsStoreBase with _$TransactionsDetailsStore;

abstract class _TransactionsDetailsStoreBase with Store {
  final TransactionsRepositoryImpl _repository;
  final TransactionsListStore _transactionsListStore;
  final AuthStore authStore;

  _TransactionsDetailsStoreBase(this._repository, this._transactionsListStore, this.authStore);

  @observable
  TransactionModel? transaction;
  @action
  void setTransaction(TransactionModel value) => transaction = value;

  @observable
  bool isLoading = false;
  @action
  void setIsLoading(bool value) => isLoading = value;

  @observable
  Failure? onError;
  @action
  void setOnError(Failure? value) => onError = value;

  Future<void> getTransactionById(String docId) async {
    setIsLoading(true);
    try {
      // final data =
      await _repository.getTransactionById(docId);
      // setTransaction(data);
      setOnError(null);
    } catch (e) {
      setOnError(LoadTransactionError(message: e.toString()));
    } finally {
      setIsLoading(false);
    }
  }

  Future<bool> createTransaction(TransactionModel transaction) async {
    bool createSuccess = false;
    setIsLoading(true);
    try {
      final docId = await _repository.createTransaction(transaction);
      transaction.copyWith(id: docId);
      _transactionsListStore.setTransactions(value: transaction);
      setOnError(null);
      createSuccess = true;
    } catch (e) {
      setOnError(CreateTransactionError(message: e.toString()));
    } finally {
      setIsLoading(false);
    }
    return createSuccess;
  }

  Future<bool> updateTransaction(TransactionModel transaction) async {
    bool updateSuccess = false;
    setIsLoading(true);
    try {
      await _repository.updateTransaction(transaction);
      _transactionsListStore.setTransactions(value: transaction);
      setOnError(null);
      updateSuccess = true;
    } catch (e) {
      setOnError(UpdateTransactionError(message: e.toString()));
    } finally {
      setIsLoading(false);
    }
    return updateSuccess;
  }
}
