// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LoginController on _LoginControllerBase, Store {
  final _$showPasswordFieldAtom =
      Atom(name: '_LoginControllerBase.showPasswordField');

  @override
  bool get showPasswordField {
    _$showPasswordFieldAtom.reportRead();
    return super.showPasswordField;
  }

  @override
  set showPasswordField(bool value) {
    _$showPasswordFieldAtom.reportWrite(value, super.showPasswordField, () {
      super.showPasswordField = value;
    });
  }

  final _$listLengthAtom = Atom(name: '_LoginControllerBase.listLength');

  @override
  String get listLength {
    _$listLengthAtom.reportRead();
    return super.listLength;
  }

  @override
  set listLength(String value) {
    _$listLengthAtom.reportWrite(value, super.listLength, () {
      super.listLength = value;
    });
  }

  final _$_LoginControllerBaseActionController =
      ActionController(name: '_LoginControllerBase');

  @override
  void verifyDig() {
    final _$actionInfo = _$_LoginControllerBaseActionController.startAction(
        name: '_LoginControllerBase.verifyDig');
    try {
      return super.verifyDig();
    } finally {
      _$_LoginControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
showPasswordField: ${showPasswordField},
listLength: ${listLength}
    ''';
  }
}
