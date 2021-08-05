import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'login_controller.g.dart';

class LoginController = _LoginControllerBase with _$LoginController;

abstract class _LoginControllerBase with Store {
  bool passwordVisible = true;
  // FirebaseAuth auth = FirebaseAuth.instance;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  User? user;

  @observable
  bool showPasswordField = false;

  int total = 0;

  @observable
  String listLength = "0";

  @action
  void verifyDig() {
    if (this.emailController.text != '') {
      log(this.emailController.text);
      this.showPasswordField = true;
    } else {
      log(this.emailController.text);
      this.showPasswordField = false;
    }
  }

  @action
  Future<void> login() async {
    try {
      final response = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: "teste@teste.com", password: "qwerty");
      user = response.user;
      print(user);
    } catch (e) {
      print(e);
    }
  }
}
