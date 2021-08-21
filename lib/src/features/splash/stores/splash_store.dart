import 'package:mobx/mobx.dart';

import '../../../shared/constants/constants.dart';
import '../../../shared/stores/stores.dart';

part 'splash_store.g.dart';

class SplashStore = _SplashStoreBase with _$SplashStore;

abstract class _SplashStoreBase extends BaseStore with Store {
  final AuthStore authStore;

  _SplashStoreBase(this.authStore);

  @observable
  String navigation = '';
  @action
  void setNavigation(String value) => navigation = value;

  @override
  Future<void> init() async {
    await Future.delayed(Duration(seconds: 3));
    await handleAuthentication();
  }

  Future<void> handleAuthentication() async {
    final isAuthenticated = authStore.verifyAuthentication();
    (isAuthenticated) ? await handleAuthenticatedUser() : handleUnauthenticatedUser();
  }

  Future<void> handleUserData() async {
    await authStore.loginUser(authStore.firebaseAuth.currentUser!.uid);
    authStore.addListenAuth();
  }

  Future<void> handleAuthenticatedUser() async {
    try {
      await handleUserData();
      setNavigation(AppRoutes.home);
    } catch (e) {
      setNavigation(AppRoutes.login);
    }
  }

  void handleUnauthenticatedUser() {
    setNavigation(AppRoutes.login);
  }
}
