// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'daily_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$DailyStore on _DailyStoreBase, Store {
  Computed<String>? _$selectedMonthDescriptionComputed;

  @override
  String get selectedMonthDescription => (_$selectedMonthDescriptionComputed ??=
          Computed<String>(() => super.selectedMonthDescription,
              name: '_DailyStoreBase.selectedMonthDescription'))
      .value;

  final _$stateAtom = Atom(name: '_DailyStoreBase.state');

  @override
  DailyState get state {
    _$stateAtom.reportRead();
    return super.state;
  }

  @override
  set state(DailyState value) {
    _$stateAtom.reportWrite(value, super.state, () {
      super.state = value;
    });
  }

  final _$onErrorAtom = Atom(name: '_DailyStoreBase.onError');

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

  final _$_DailyStoreBaseActionController =
      ActionController(name: '_DailyStoreBase');

  @override
  void setState(DailyState value) {
    final _$actionInfo = _$_DailyStoreBaseActionController.startAction(
        name: '_DailyStoreBase.setState');
    try {
      return super.setState(value);
    } finally {
      _$_DailyStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setOnError(Failure value) {
    final _$actionInfo = _$_DailyStoreBaseActionController.startAction(
        name: '_DailyStoreBase.setOnError');
    try {
      return super.setOnError(value);
    } finally {
      _$_DailyStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
state: ${state},
onError: ${onError},
selectedMonthDescription: ${selectedMonthDescription}
    ''';
  }
}
