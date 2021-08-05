import 'package:budget/src/shared/auth/auth_controller.dart';
import 'package:budget/src/shared/constants/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'login_controller.g.dart';

class LoginController = _LoginControllerBase with _$LoginController;

abstract class _LoginControllerBase with Store {
  bool passwordVisible = true;
  FirebaseAuth auth = FirebaseAuth.instance;
  FocusNode emailFocusNode = new FocusNode();
  FocusNode passwordFocusNode = new FocusNode();
  @observable
  bool showPasswordField = false;

  int total = 0;

  @observable
  String listLength = "0";

  @observable
  TextEditingController emailController = TextEditingController();

  @observable
  TextEditingController passwordController = TextEditingController();

  @action
  void verifyDig() {
    if (this.emailController.text != '') {
      this.showPasswordField = true;
    } else {
      this.showPasswordField = false;
    }
  }

  @action
  Future<void> login(
    String email,
    String password,
  ) async {
    try {
      final response = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      AuthController.instance.loginUser(response.user!);
      Modular.to.pushReplacementNamed(AppRoutes.home);
      print(response.user!);
    } catch (e) {
      print(e);
    }
  }
}
