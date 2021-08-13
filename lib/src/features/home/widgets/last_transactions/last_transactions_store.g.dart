// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'last_transactions_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LastTransactionsStore on _LastTransactionsStoreBase, Store {
  final _$stateAtom = Atom(name: '_LastTransactionsStoreBase.state');

  @override
  LastTransactionsState get state {
    _$stateAtom.reportRead();
    return super.state;
  }

  @override
  set state(LastTransactionsState value) {
    _$stateAtom.reportWrite(value, super.state, () {
      super.state = value;
    });
  }

  final _$onErrorAtom = Atom(name: '_LastTransactionsStoreBase.onError');

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

  final _$_LastTransactionsStoreBaseActionController =
      ActionController(name: '_LastTransactionsStoreBase');

  @override
  void setState(LastTransactionsState value) {
    final _$actionInfo = _$_LastTransactionsStoreBaseActionController
        .startAction(name: '_LastTransactionsStoreBase.setState');
    try {
      return super.setState(value);
    } finally {
      _$_LastTransactionsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setOnError(Failure value) {
    final _$actionInfo = _$_LastTransactionsStoreBaseActionController
        .startAction(name: '_LastTransactionsStoreBase.setOnError');
    try {
      return super.setOnError(value);
    } finally {
      _$_LastTransactionsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
state: ${state},
onError: ${onError}
    ''';
  }
}
