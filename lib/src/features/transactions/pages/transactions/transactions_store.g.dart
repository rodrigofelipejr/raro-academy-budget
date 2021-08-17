// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transactions_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$TransactionsStore on _TransactionsStoreBase, Store {
  Computed<List<TransactionModel>>? _$transactionOutputComputed;

  @override
  List<TransactionModel> get transactionOutput =>
      (_$transactionOutputComputed ??= Computed<List<TransactionModel>>(
              () => super.transactionOutput,
              name: '_TransactionsStoreBase.transactionOutput'))
          .value;
  Computed<List<TransactionModel>>? _$transactionInputComputed;

  @override
  List<TransactionModel> get transactionInput => (_$transactionInputComputed ??=
          Computed<List<TransactionModel>>(() => super.transactionInput,
              name: '_TransactionsStoreBase.transactionInput'))
      .value;
  Computed<double>? _$transactionOutputTotalComputed;

  @override
  double get transactionOutputTotal => (_$transactionOutputTotalComputed ??=
          Computed<double>(() => super.transactionOutputTotal,
              name: '_TransactionsStoreBase.transactionOutputTotal'))
      .value;
  Computed<double>? _$transactionInputTotalComputed;

  @override
  double get transactionInputTotal => (_$transactionInputTotalComputed ??=
          Computed<double>(() => super.transactionInputTotal,
              name: '_TransactionsStoreBase.transactionInputTotal'))
      .value;
  Computed<double>? _$transactionTotalComputed;

  @override
  double get transactionTotal => (_$transactionTotalComputed ??=
          Computed<double>(() => super.transactionTotal,
              name: '_TransactionsStoreBase.transactionTotal'))
      .value;

  final _$transactionsAtom = Atom(name: '_TransactionsStoreBase.transactions');

  @override
  List<TransactionModel> get transactions {
    _$transactionsAtom.reportRead();
    return super.transactions;
  }

  @override
  set transactions(List<TransactionModel> value) {
    _$transactionsAtom.reportWrite(value, super.transactions, () {
      super.transactions = value;
    });
  }

  final _$indexPageAtom = Atom(name: '_TransactionsStoreBase.indexPage');

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

  final _$isLoadingAtom = Atom(name: '_TransactionsStoreBase.isLoading');

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

  final _$onErrorAtom = Atom(name: '_TransactionsStoreBase.onError');

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

  final _$_TransactionsStoreBaseActionController =
      ActionController(name: '_TransactionsStoreBase');

  @override
  void setTransactions(List<TransactionModel> value) {
    final _$actionInfo = _$_TransactionsStoreBaseActionController.startAction(
        name: '_TransactionsStoreBase.setTransactions');
    try {
      return super.setTransactions(value);
    } finally {
      _$_TransactionsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setIndexPage(int value) {
    final _$actionInfo = _$_TransactionsStoreBaseActionController.startAction(
        name: '_TransactionsStoreBase.setIndexPage');
    try {
      return super.setIndexPage(value);
    } finally {
      _$_TransactionsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setIsLoading(bool value) {
    final _$actionInfo = _$_TransactionsStoreBaseActionController.startAction(
        name: '_TransactionsStoreBase.setIsLoading');
    try {
      return super.setIsLoading(value);
    } finally {
      _$_TransactionsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setOnError(Failure? value) {
    final _$actionInfo = _$_TransactionsStoreBaseActionController.startAction(
        name: '_TransactionsStoreBase.setOnError');
    try {
      return super.setOnError(value);
    } finally {
      _$_TransactionsStoreBaseActionController.endAction(_$actionInfo);
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
