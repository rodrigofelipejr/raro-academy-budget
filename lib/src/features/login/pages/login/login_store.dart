import 'package:firebase_auth/firebase_auth.dart';
import 'package:mobx/mobx.dart';

import '../../../../shared/stores/stores.dart';
import 'login_state.dart';
import 'repositories/repositories.dart';
import 'utils/firebase_errors.dart';

part 'login_store.g.dart';

class LoginStore = _LoginStoreBase with _$LoginStore;

abstract class _LoginStoreBase with Store {
  final FirebaseAuth firebaseAuth;
  final AuthStore authStore;
  final LoginRepository _repository;

  _LoginStoreBase(this.firebaseAuth, this.authStore, this._repository);

  @observable
  LoginState state = LoginState();
  @action
  void setState(LoginState value) => state = value;

  @observable
  bool isLoading = false;
  @action
  void setIsLoading(bool value) => isLoading = value;

  void onChange({String? email, String? password, bool? passwordContentVisible}) {
    setState(
      state.copyWith(
        email: email ?? state.email,
        password: password ?? state.password,
        passwordContentVisible: passwordContentVisible ?? state.passwordContentVisible,
      ),
    );
  }

  @computed
  bool get disabledButton => (state.email.isEmpty || state.password.isEmpty || state.password.length < 6);

  @computed
  bool get showPasswordField => state.email.isNotEmpty;

  Future<bool> login() async {
    bool loginSuccess = false;
    setIsLoading(true);

    try {
      final userCredential = await _repository.signInWithEmailAndPassword(email: state.email, password: state.password);
      await authStore.loginUser(userCredential.user!.uid);
      loginSuccess = true;
      authStore.addListenAuth();
    } on FirebaseAuthException catch (e) {
      final errorMessage = FireBaseErrors.verifyErroCode(e.code);
      setState(state.copyWith(passwordError: errorMessage));
    } finally {
      setIsLoading(false);
    }

    return loginSuccess;
  }
}
