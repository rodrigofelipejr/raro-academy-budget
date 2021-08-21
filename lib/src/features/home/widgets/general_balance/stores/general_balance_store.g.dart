// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'general_balance_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$GeneralBalanceStore on _GeneralBalanceStoreBase, Store {
  final _$stateAtom = Atom(name: '_GeneralBalanceStoreBase.state');

  @override
  GeneralBalanceState get state {
    _$stateAtom.reportRead();
    return super.state;
  }

  @override
  set state(GeneralBalanceState value) {
    _$stateAtom.reportWrite(value, super.state, () {
      super.state = value;
    });
  }

  final _$onErrorAtom = Atom(name: '_GeneralBalanceStoreBase.onError');

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

  final _$visibleBalanceAtom =
      Atom(name: '_GeneralBalanceStoreBase.visibleBalance');

  @override
  bool get visibleBalance {
    _$visibleBalanceAtom.reportRead();
    return super.visibleBalance;
  }

  @override
  set visibleBalance(bool value) {
    _$visibleBalanceAtom.reportWrite(value, super.visibleBalance, () {
      super.visibleBalance = value;
    });
  }

  final _$_GeneralBalanceStoreBaseActionController =
      ActionController(name: '_GeneralBalanceStoreBase');

  @override
  void setState(GeneralBalanceState value) {
    final _$actionInfo = _$_GeneralBalanceStoreBaseActionController.startAction(
        name: '_GeneralBalanceStoreBase.setState');
    try {
      return super.setState(value);
    } finally {
      _$_GeneralBalanceStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setOnError(Failure? value) {
    final _$actionInfo = _$_GeneralBalanceStoreBaseActionController.startAction(
        name: '_GeneralBalanceStoreBase.setOnError');
    try {
      return super.setOnError(value);
    } finally {
      _$_GeneralBalanceStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setVisibleBalance(bool value) {
    final _$actionInfo = _$_GeneralBalanceStoreBaseActionController.startAction(
        name: '_GeneralBalanceStoreBase.setVisibleBalance');
    try {
      return super.setVisibleBalance(value);
    } finally {
      _$_GeneralBalanceStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
state: ${state},
onError: ${onError},
visibleBalance: ${visibleBalance}
    ''';
  }
}
