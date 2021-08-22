// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transactions_list_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$TransactionsListStore on _TransactionsListStoreBase, Store {
  Computed<List<TransactionModel>>? _$transactionOutputComputed;

  @override
  List<TransactionModel> get transactionOutput =>
      (_$transactionOutputComputed ??= Computed<List<TransactionModel>>(
              () => super.transactionOutput,
              name: '_TransactionsListStoreBase.transactionOutput'))
          .value;
  Computed<List<TransactionModel>>? _$transactionInputComputed;

  @override
  List<TransactionModel> get transactionInput => (_$transactionInputComputed ??=
          Computed<List<TransactionModel>>(() => super.transactionInput,
              name: '_TransactionsListStoreBase.transactionInput'))
      .value;
  Computed<double>? _$transactionOutputTotalComputed;

  @override
  double get transactionOutputTotal => (_$transactionOutputTotalComputed ??=
          Computed<double>(() => super.transactionOutputTotal,
              name: '_TransactionsListStoreBase.transactionOutputTotal'))
      .value;
  Computed<double>? _$transactionInputTotalComputed;

  @override
  double get transactionInputTotal => (_$transactionInputTotalComputed ??=
          Computed<double>(() => super.transactionInputTotal,
              name: '_TransactionsListStoreBase.transactionInputTotal'))
      .value;
  Computed<double>? _$transactionTotalComputed;

  @override
  double get transactionTotal => (_$transactionTotalComputed ??=
          Computed<double>(() => super.transactionTotal,
              name: '_TransactionsListStoreBase.transactionTotal'))
      .value;

  final _$transactionsAtom =
      Atom(name: '_TransactionsListStoreBase.transactions');

  @override
  ObservableList<TransactionModel> get transactions {
    _$transactionsAtom.reportRead();
    return super.transactions;
  }

  @override
  set transactions(ObservableList<TransactionModel> value) {
    _$transactionsAtom.reportWrite(value, super.transactions, () {
      super.transactions = value;
    });
  }

  final _$indexPageAtom = Atom(name: '_TransactionsListStoreBase.indexPage');

  @override
  int get indexPage {
    _$indexPageAtom.reportRead();
    return super.indexPage;
  }

  @override
  set indexPage(int value) {
    _$indexPageAtom.reportWrite(value, super.indexPage, () {
      super.indexPage = value;
    });
  }

  final _$isLoadingAtom = Atom(name: '_TransactionsListStoreBase.isLoading');

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  final _$onErrorAtom = Atom(name: '_TransactionsListStoreBase.onError');

  @override
  Failure? get onError {
    _$onErrorAtom.reportRead();
    return super.onError;
  }

  @override
  set onError(Failure? value) {
    _$onErrorAtom.reportWrite(value, super.onError, () {
      super.onError = value;
    });
  }

  final _$_TransactionsListStoreBaseActionController =
      ActionController(name: '_TransactionsListStoreBase');

  @override
  void setTransactions(
      {List<TransactionModel>? values, TransactionModel? value}) {
    final _$actionInfo = _$_TransactionsListStoreBaseActionController
        .startAction(name: '_TransactionsListStoreBase.setTransactions');
    try {
      return super.setTransactions(values: values, value: value);
    } finally {
      _$_TransactionsListStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setIndexPage(int value) {
    final _$actionInfo = _$_TransactionsListStoreBaseActionController
        .startAction(name: '_TransactionsListStoreBase.setIndexPage');
    try {
      return super.setIndexPage(value);
    } finally {
      _$_TransactionsListStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setIsLoading(bool value) {
    final _$actionInfo = _$_TransactionsListStoreBaseActionController
        .startAction(name: '_TransactionsListStoreBase.setIsLoading');
    try {
      return super.setIsLoading(value);
    } finally {
      _$_TransactionsListStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setOnError(Failure? value) {
    final _$actionInfo = _$_TransactionsListStoreBaseActionController
        .startAction(name: '_TransactionsListStoreBase.setOnError');
    try {
      return super.setOnError(value);
    } finally {
      _$_TransactionsListStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
transactions: ${transactions},
indexPage: ${indexPage},
isLoading: ${isLoading},
onError: ${onError},
transactionOutput: ${transactionOutput},
transactionInput: ${transactionInput},
transactionOutputTotal: ${transactionOutputTotal},
transactionInputTotal: ${transactionInputTotal},
transactionTotal: ${transactionTotal}
    ''';
  }
}
