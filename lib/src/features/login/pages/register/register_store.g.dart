// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$RegisterStore on _RegisterStoreBase, Store {
  Computed<Text?>? _$showErrorPolicyComputed;

  @override
  Text? get showErrorPolicy => (_$showErrorPolicyComputed ??= Computed<Text?>(
          () => super.showErrorPolicy,
          name: '_RegisterStoreBase.showErrorPolicy'))
      .value;

  final _$currentPageAtom = Atom(name: '_RegisterStoreBase.currentPage');

  @override
  int get currentPage {
    _$currentPageAtom.reportRead();
    return super.currentPage;
  }

  @override
  set currentPage(int value) {
    _$currentPageAtom.reportWrite(value, super.currentPage, () {
      super.currentPage = value;
    });
  }

  final _$errorMessageAtom = Atom(name: '_RegisterStoreBase.errorMessage');

  @override
  String? get errorMessage {
    _$errorMessageAtom.reportRead();
    return super.errorMessage;
  }

  @override
  set errorMessage(String? value) {
    _$errorMessageAtom.reportWrite(value, super.errorMessage, () {
      super.errorMessage = value;
    });
  }

  final _$policyAtom = Atom(name: '_RegisterStoreBase.policy');

  @override
  bool get policy {
    _$policyAtom.reportRead();
    return super.policy;
  }

  @override
  set policy(bool value) {
    _$policyAtom.reportWrite(value, super.policy, () {
      super.policy = value;
    });
  }

  final _$passwordVisibleAtom =
      Atom(name: '_RegisterStoreBase.passwordVisible');

  @override
  bool get passwordVisible {
    _$passwordVisibleAtom.reportRead();
    return super.passwordVisible;
  }

  @override
  set passwordVisible(bool value) {
    _$passwordVisibleAtom.reportWrite(value, super.passwordVisible, () {
      super.passwordVisible = value;
    });
  }

  final _$confirmPasswordVisibleAtom =
      Atom(name: '_RegisterStoreBase.confirmPasswordVisible');

  @override
  bool get confirmPasswordVisible {
    _$confirmPasswordVisibleAtom.reportRead();
    return super.confirmPasswordVisible;
  }

  @override
  set confirmPasswordVisible(bool value) {
    _$confirmPasswordVisibleAtom
        .reportWrite(value, super.confirmPasswordVisible, () {
      super.confirmPasswordVisible = value;
    });
  }

  final _$loadingAtom = Atom(name: '_RegisterStoreBase.loading');

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  final _$errorPolicyAtom = Atom(name: '_RegisterStoreBase.errorPolicy');

  @override
  bool get errorPolicy {
    _$errorPolicyAtom.reportRead();
    return super.errorPolicy;
  }

  @override
  set errorPolicy(bool value) {
    _$errorPolicyAtom.reportWrite(value, super.errorPolicy, () {
      super.errorPolicy = value;
    });
  }

  final _$loginAsyncAction = AsyncAction('_RegisterStoreBase.login');

  @override
  Future<void> login(UserModel userModel, String email, String password,
      BuildContext context) {
    return _$loginAsyncAction
        .run(() => super.login(userModel, email, password, context));
  }

  final _$verifyErrorAsyncAction =
      AsyncAction('_RegisterStoreBase.verifyError');

  @override
  Future<void> verifyError(FirebaseAuthException e) {
    return _$verifyErrorAsyncAction.run(() => super.verifyError(e));
  }

  final _$_RegisterStoreBaseActionController =
      ActionController(name: '_RegisterStoreBase');

  @override
  void updateCurrentPage(int index) {
    final _$actionInfo = _$_RegisterStoreBaseActionController.startAction(
        name: '_RegisterStoreBase.updateCurrentPage');
    try {
      return super.updateCurrentPage(index);
    } finally {
      _$_RegisterStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void updatePolicy(bool? value) {
    final _$actionInfo = _$_RegisterStoreBaseActionController.startAction(
        name: '_RegisterStoreBase.updatePolicy');
    try {
      return super.updatePolicy(value);
    } finally {
      _$_RegisterStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void updateConfirmPasswordVisible(bool value) {
    final _$actionInfo = _$_RegisterStoreBaseActionController.startAction(
        name: '_RegisterStoreBase.updateConfirmPasswordVisible');
    try {
      return super.updateConfirmPasswordVisible(value);
    } finally {
      _$_RegisterStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void updatePasswordVisible(bool value) {
    final _$actionInfo = _$_RegisterStoreBaseActionController.startAction(
        name: '_RegisterStoreBase.updatePasswordVisible');
    try {
      return super.updatePasswordVisible(value);
    } finally {
      _$_RegisterStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void updateErrorPolicy(bool value) {
    final _$actionInfo = _$_RegisterStoreBaseActionController.startAction(
        name: '_RegisterStoreBase.updateErrorPolicy');
    try {
      return super.updateErrorPolicy(value);
    } finally {
      _$_RegisterStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
currentPage: ${currentPage},
errorMessage: ${errorMessage},
policy: ${policy},
passwordVisible: ${passwordVisible},
confirmPasswordVisible: ${confirmPasswordVisible},
loading: ${loading},
errorPolicy: ${errorPolicy},
showErrorPolicy: ${showErrorPolicy}
    ''';
  }
}
