// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'daily_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$DailyStore on _DailyStoreBase, Store {
  Computed<List<TransactionModel>>? _$transactionOutputComputed;

  @override
  List<TransactionModel> get transactionOutput =>
      (_$transactionOutputComputed ??= Computed<List<TransactionModel>>(
              () => super.transactionOutput,
              name: '_DailyStoreBase.transactionOutput'))
          .value;
  Computed<List<TransactionModel>>? _$transactionInputComputed;

  @override
  List<TransactionModel> get transactionInput => (_$transactionInputComputed ??=
          Computed<List<TransactionModel>>(() => super.transactionInput,
              name: '_DailyStoreBase.transactionInput'))
      .value;
  Computed<double>? _$transactionOutputTotalComputed;

  @override
  double get transactionOutputTotal => (_$transactionOutputTotalComputed ??=
          Computed<double>(() => super.transactionOutputTotal,
              name: '_DailyStoreBase.transactionOutputTotal'))
      .value;
  Computed<double>? _$transactionInputTotalComputed;

  @override
  double get transactionInputTotal => (_$transactionInputTotalComputed ??=
          Computed<double>(() => super.transactionInputTotal,
              name: '_DailyStoreBase.transactionInputTotal'))
      .value;
  Computed<double>? _$transactionTotalComputed;

  @override
  double get transactionTotal => (_$transactionTotalComputed ??=
          Computed<double>(() => super.transactionTotal,
              name: '_DailyStoreBase.transactionTotal'))
      .value;

  final _$transactionsAtom = Atom(name: '_DailyStoreBase.transactions');

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

  final _$indexPageAtom = Atom(name: '_DailyStoreBase.indexPage');

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

  final _$_DailyStoreBaseActionController =
      ActionController(name: '_DailyStoreBase');

  @override
  void setTransactions(List<TransactionModel> value) {
    final _$actionInfo = _$_DailyStoreBaseActionController.startAction(
        name: '_DailyStoreBase.setTransactions');
    try {
      return super.setTransactions(value);
    } finally {
      _$_DailyStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setIndexPage(int value) {
    final _$actionInfo = _$_DailyStoreBaseActionController.startAction(
        name: '_DailyStoreBase.setIndexPage');
    try {
      return super.setIndexPage(value);
    } finally {
      _$_DailyStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
transactions: ${transactions},
indexPage: ${indexPage},
transactionOutput: ${transactionOutput},
transactionInput: ${transactionInput},
transactionOutputTotal: ${transactionOutputTotal},
transactionInputTotal: ${transactionInputTotal},
transactionTotal: ${transactionTotal}
    ''';
  }
}
