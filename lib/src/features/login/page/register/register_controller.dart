import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import 'package:budget/src/features/login/page/models/models.dart';
import 'package:budget/src/features/login/page/register/repositories/register_repository.dart';
import 'package:budget/src/shared/constants/app_routes.dart';

part 'register_controller.g.dart';

class RegisterController = _RegisterControllerBase with _$RegisterController;

abstract class _RegisterControllerBase with Store {
  final PageController pageController = PageController(initialPage: 0);
  final formKeyNameAndEmail = GlobalKey<FormState>();
  final formKeyPhoneAndCpf = GlobalKey<FormState>();
  final formKeyPassword = GlobalKey<FormState>();

  FocusNode emailFocusNode = new FocusNode();
  TextEditingController emailController = TextEditingController();
  FocusNode nameFocusNode = new FocusNode();
  TextEditingController nameController = TextEditingController();

  FocusNode phoneFocusNode = new FocusNode();
  TextEditingController phoneController = TextEditingController();
  FocusNode cpfFocusNode = new FocusNode();
  TextEditingController cpfController = TextEditingController();

  FocusNode passwordFocusNode = new FocusNode();
  TextEditingController passwordController = TextEditingController();
  FocusNode confirmPasswordFocusNode = new FocusNode();
  TextEditingController confirmPasswordController = TextEditingController();

  final RegisterRepository repository;

  @observable
  int currentPage = 0;

  @observable
  bool policy = false;

  @observable
  bool passwordVisible = true;

  @observable
  bool confirmPasswordVisible = true;

  @observable
  bool loading = false;

  _RegisterControllerBase(this.repository);

  @action
  void updateCurrentPage(int index) {
    this.currentPage = index;
  }

  @action
  void updatePolicy(bool? value) {
    this.policy = value!;
  }

  @action
  void updateConfirmPasswordVisible(bool value) {
    this.confirmPasswordVisible = value;
  }

  @action
  void updatePasswordVisible(bool value) {
    this.passwordVisible = value;
  }

  void pushPage() {
    pageController.jumpToPage(this.currentPage + 1);
  }

  void popPage() {
    if (this.currentPage == 0) {
      Modular.to.popAndPushNamed(AppRoutes.login);
    } else {
      pageController.jumpToPage(this.currentPage - 1);
    }
  }

  Future<void> createUser() async {
    try {
      print('dasdasdasd');
      this.loading = true;
      await repository.createUser(User(
          cpf: this.cpfController.text,
          name: this.nameController.text,
          phone: this.phoneController.text,
          termsAndConditions: policy,
          uuid: 'Teste Save 00001'));
      this.loading = false;
    } catch (e) {
      this.loading = false;
      print(e);
    }
  }

  void nextPage() {
    if (currentPage == 0) {
      if (formKeyNameAndEmail.currentState!.validate()) {
        pushPage();
      }
    } else if (currentPage == 1) {
      if (formKeyPhoneAndCpf.currentState!.validate()) {
        pushPage();
      }
    } else if (currentPage == 2) {
      if (this.policy == true) {
        pushPage();
      }
    } else if (currentPage == 3) {
      if (formKeyPassword.currentState!.validate()) {
        pushPage();
        this.createUser();
      }
    }
  }

  @override
  String toString() {
    return '_RegisterControllerBase(repository: $repository, currentPage: $currentPage, policy: $policy, passwordVisible: $passwordVisible, confirmPasswordVisible: $confirmPasswordVisible, loading: $loading)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is _RegisterControllerBase &&
        other.repository == repository &&
        other.currentPage == currentPage &&
        other.policy == policy &&
        other.passwordVisible == passwordVisible &&
        other.confirmPasswordVisible == confirmPasswordVisible &&
        other.loading == loading;
  }

  @override
  int get hashCode {
    return repository.hashCode ^
        currentPage.hashCode ^
        policy.hashCode ^
        passwordVisible.hashCode ^
        confirmPasswordVisible.hashCode ^
        loading.hashCode;
  }
}
