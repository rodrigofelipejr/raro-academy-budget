import 'package:budget/src/features/login/repositories/register_repository.dart';
import 'package:budget/src/features/login/utils/firebase_errors.dart';
import 'package:budget/src/shared/constants/app_colors.dart';
import 'package:budget/src/shared/models/user_model.dart';
import 'package:budget/src/shared/stores/stores.dart';
import 'package:budget/src/shared/widgets/dialog/dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:budget/src/shared/constants/app_routes.dart';

part 'register_store.g.dart';

class RegisterStore = _RegisterStoreBase with _$RegisterStore;

abstract class _RegisterStoreBase with Store {
  final RegisterRepository repository;
  final AuthStore authStore;

  _RegisterStoreBase(this.repository, this.authStore);

  final PageController pageController = PageController(initialPage: 0);

  @observable
  int currentPage = 0;

  @observable
  String? errorMessage;

  @observable
  bool policy = false;

  @observable
  bool passwordVisible = true;

  @observable
  bool confirmPasswordVisible = true;

  @observable
  bool loading = false;

  @observable
  bool errorPolicy = false;

  @computed
  Text? get showErrorPolicy {
    if (this.errorPolicy) {
      return Text(
        'Você deve aceitar o termos e condições.',
        style: TextStyle(
          color: AppColors.vermelho,
          fontFamily: 'roboto',
          fontSize: 12,
          fontWeight: FontWeight.w400,
        ),
      );
    }
  }

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

  @action
  void updateErrorPolicy(bool value) {
    this.errorPolicy = value;
  }

  @action
  Future<void> login(UserModel userModel, String email, String password, BuildContext context) async {
    errorMessage = null;
    try {
      loading = true;
      final response = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
      this.authStore.loginUser(response.user!.uid);
      userModel = userModel.copyWith(uuid: response.user!.uid);

      this.createUser(userModel);
    } on FirebaseAuthException catch (e) {
      showDialog(
        context: context,
        builder: (_) => DialogWidget.error(
            type: DialogTypeEnum.error,
            title: 'Ops',
            message: FireBaseErrors.verifyErroCode(e.code),
            textButtonPrimary: 'ok',
            onPressedPrimary: () => this.verifyError(e)),
      );
      loading = false;
    }
  }

  @action
  Future<void> verifyError(FirebaseAuthException e) async {
    if (e.code == 'email-already-in-use' ||
        e.code == 'invalid-email' ||
        e.code == 'invalid-email-verified' ||
        e.code == 'email-already-exists') {
      errorMessage = FireBaseErrors.verifyErroCode(e.code);
      pageController.jumpToPage(0);
    }
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

  Future<void> createUser(UserModel userModel) async {
    try {
      await repository.createUser(userModel);
      this.authStore.addListenAuth();
      Modular.to.pushNamed(AppRoutes.onboarding);
      this.loading = false;
    } catch (e) {
      this.loading = false;
      print(e);
    }
  }

  @override
  String toString() {
    return '_RegisterControllerBase(repository: $repository, currentPage: $currentPage, policy: $policy, passwordVisible: $passwordVisible, confirmPasswordVisible: $confirmPasswordVisible, loading: $loading)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is _RegisterStoreBase &&
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
