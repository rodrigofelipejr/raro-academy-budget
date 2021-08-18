import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../../constants/constants.dart';
import '../../models/user_model.dart';
import '../../repositories/auth/auth_repository.dart';
import '../../../shared/utils/utils.dart';

part 'auth_store.g.dart';

class AuthStore = _AuthStoreBase with _$AuthStore;

abstract class _AuthStoreBase with Store implements Disposable {
  final FirebaseAuth firebaseAuth;
  final AuthRepository repository;

  _AuthStoreBase(this.firebaseAuth, this.repository);

  StreamSubscription<User?>? listen;

  void addListenAuth() async {
    listen = firebaseAuth.authStateChanges().listen((User? user) {
      if (user == null) Modular.to.pushReplacementNamed(AppRoutes.login);
    });
  }

  @override
  void dispose() {
    listen?.cancel();
  }

  @observable
  UserModel? user;
  @action
  void setUser(UserModel? value) => user = value;

  @computed
  String get welcomeMessage {
    final String userName = user?.name ?? '';
    return userName.isEmpty ? 'Seja bem-vindo!' : 'Olá, ${userName.firstName().capitalize()}';
  }

  bool verifyAuthentication() {
    return firebaseAuth.currentUser != null;
  }

  Future<UserModel> _getUserData(String uuid) async {
    return await repository.getUser(uuid);
  }

  Future<void> loginUser(String uuid) async {
    final data = await _getUserData(uuid);
    setUser(data);
  }

  Future<void> logoffUser() async {
    await firebaseAuth.signOut();
    setUser(null);
  }
}
