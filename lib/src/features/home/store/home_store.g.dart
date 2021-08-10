// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeStore on _HomeStoreBase, Store {
  Computed<String>? _$selectedMonthDescriptionComputed;

  @override
  String get selectedMonthDescription => (_$selectedMonthDescriptionComputed ??=
          Computed<String>(() => super.selectedMonthDescription,
              name: '_HomeStoreBase.selectedMonthDescription'))
      .value;

  final _$stateAtom = Atom(name: '_HomeStoreBase.state');

  @override
  HomeState get state {
    _$stateAtom.reportRead();
    return super.state;
  }

  @override
  set state(HomeState value) {
    _$stateAtom.reportWrite(value, super.state, () {
      super.state = value;
    });
  }

  final _$isLoadingAtom = Atom(name: '_HomeStoreBase.isLoading');

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

  final _$onErrorAtom = Atom(name: '_HomeStoreBase.onError');

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

  final _$_HomeStoreBaseActionController =
      ActionController(name: '_HomeStoreBase');

  @override
  void setState(HomeState value) {
    final _$actionInfo = _$_HomeStoreBaseActionController.startAction(
        name: '_HomeStoreBase.setState');
    try {
      return super.setState(value);
    } finally {
      _$_HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setIsLoading(bool value) {
    final _$actionInfo = _$_HomeStoreBaseActionController.startAction(
        name: '_HomeStoreBase.setIsLoading');
    try {
      return super.setIsLoading(value);
    } finally {
      _$_HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setOnError(Failure? value) {
    final _$actionInfo = _$_HomeStoreBaseActionController.startAction(
        name: '_HomeStoreBase.setOnError');
    try {
      return super.setOnError(value);
    } finally {
      _$_HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
state: ${state},
isLoading: ${isLoading},
onError: ${onError},
selectedMonthDescription: ${selectedMonthDescription}
    ''';
  }
}
