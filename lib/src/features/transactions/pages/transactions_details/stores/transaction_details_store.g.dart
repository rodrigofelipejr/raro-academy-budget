// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_details_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$TransactionsDetailsStore on _TransactionsDetailsStoreBase, Store {
  final _$transactionAtom =
      Atom(name: '_TransactionsDetailsStoreBase.transaction');

  @override
  TransactionModel? get transaction {
    _$transactionAtom.reportRead();
    return super.transaction;
  }

  @override
  set transaction(TransactionModel? value) {
    _$transactionAtom.reportWrite(value, super.transaction, () {
      super.transaction = value;
    });
  }

  final _$isLoadingAtom = Atom(name: '_TransactionsDetailsStoreBase.isLoading');

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

  final _$onErrorAtom = Atom(name: '_TransactionsDetailsStoreBase.onError');

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

  final _$_TransactionsDetailsStoreBaseActionController =
      ActionController(name: '_TransactionsDetailsStoreBase');

  @override
  void setTransaction(TransactionModel value) {
    final _$actionInfo = _$_TransactionsDetailsStoreBaseActionController
        .startAction(name: '_TransactionsDetailsStoreBase.setTransaction');
    try {
      return super.setTransaction(value);
    } finally {
      _$_TransactionsDetailsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setIsLoading(bool value) {
    final _$actionInfo = _$_TransactionsDetailsStoreBaseActionController
        .startAction(name: '_TransactionsDetailsStoreBase.setIsLoading');
    try {
      return super.setIsLoading(value);
    } finally {
      _$_TransactionsDetailsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setOnError(Failure? value) {
    final _$actionInfo = _$_TransactionsDetailsStoreBaseActionController
        .startAction(name: '_TransactionsDetailsStoreBase.setOnError');
    try {
      return super.setOnError(value);
    } finally {
      _$_TransactionsDetailsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
transaction: ${transaction},
isLoading: ${isLoading},
onError: ${onError}
    ''';
  }
}
