import 'package:budget/src/shared/constants/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'register_controller.g.dart';

class RegisterController = _RegisterControllerBase with _$RegisterController;

abstract class _RegisterControllerBase with Store {
  final PageController pageController = PageController(initialPage: 0);
  final formKeyNameAndEmail = GlobalKey<FormState>();
  final formKeyPhoneAndCpf = GlobalKey<FormState>();
  final formKeyPassword = GlobalKey<FormState>();

  @observable
  int currentPage = 0;

  @observable
  bool policy = false;

  @observable
  bool passwordVisible = true;

  @observable
  bool confirmPasswordVisible = true;

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

  void updatePasswordVisible(bool value) {
    this.passwordVisible = value;
  }

  @action
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
      }
    }
  }
}
