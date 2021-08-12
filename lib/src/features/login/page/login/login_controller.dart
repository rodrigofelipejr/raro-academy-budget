import 'package:budget/src/shared/auth/auth_controller.dart';
import 'package:budget/src/shared/constants/app_routes.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'login_controller.g.dart';

class LoginController = _LoginControllerBase with _$LoginController;

abstract class _LoginControllerBase with Store {
  bool passwordVisible = true;
  FirebaseAuth auth = FirebaseAuth.instance;

  @observable
  bool showPasswordField = false;
  int total = 0;

  @observable
  String listLength = "0";

  @observable
  String email = "";

  @observable
  String password = "";

  @action
  void setEmail(String value) {
    email = value;
  }

  @action
  void setPassword(String value) {
    password = value;
  }

  @action
  void verifyDig() {
    if (this.email != '') {
      this.showPasswordField = true;
    } else {
      this.showPasswordField = false;
    }
  }

  @computed
  bool get disabledButton =>
      (email.isEmpty || password.isEmpty || password.length < 6);

  @action
  Future<void> login(
    String email,
    String password,
  ) async {
    try {
      final response = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      AuthController.instance.loginUser(response.user!);
      Modular.to.pushNamed(AppRoutes.home);
    } catch (e) {
      print(e);
    }
  }

  callLogin() {
    login(email, password).then((value) => {});
  }
}
