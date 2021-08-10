// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'daily_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$DailyStore on _DailyStoreBase, Store {
  final _$transactionListAtom = Atom(name: '_DailyStoreBase.transactionList');

  @override
  ObservableFuture<List<TransactionModel>>? get transactionList {
    _$transactionListAtom.reportRead();
    return super.transactionList;
  }

  @override
  set transactionList(ObservableFuture<List<TransactionModel>>? value) {
    _$transactionListAtom.reportWrite(value, super.transactionList, () {
      super.transactionList = value;
    });
  }

  final _$_DailyStoreBaseActionController =
      ActionController(name: '_DailyStoreBase');

  @override
  dynamic getList() {
    final _$actionInfo = _$_DailyStoreBaseActionController.startAction(
        name: '_DailyStoreBase.getList');
    try {
      return super.getList();
    } finally {
      _$_DailyStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
transactionList: ${transactionList}
    ''';
  }
}
