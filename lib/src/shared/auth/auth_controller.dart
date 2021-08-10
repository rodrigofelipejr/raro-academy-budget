import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

enum AuthState { empty, loading, authenticated, unauthenticated, error }

class AuthController {
  static AuthController? _instance;
  final navigatorKey = GlobalKey<NavigatorState>();

  AuthController() {
    listen(() {
      if (AuthController.instance.state == AuthState.unauthenticated) {
        navigatorKey.currentState!.pushReplacementNamed("/login");
      } else if (AuthController.instance.state == AuthState.authenticated) {
        navigatorKey.currentState!.pushReplacementNamed("/home");
      }
    });
  }

  static AuthController get instance {
    if (_instance == null) {
      _instance = AuthController();
    }
    return _instance!;
  }

  final _stateNotifier = ValueNotifier<AuthState>(AuthState.unauthenticated);
  set _state(AuthState state) => _stateNotifier.value = state;
  AuthState get state => _stateNotifier.value;

  void listen(void Function() listener) {
    _stateNotifier.addListener(listener);
  }

  User? user;

  Future<void> init() async {
    _state = AuthState.loading;
    await Future.delayed(Duration(milliseconds: 1400));

    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        _state = AuthState.unauthenticated;
      } else {
        _state = AuthState.authenticated;
      }
      _setUser(user);
    });
  }

  Future<void> _setUser(User? user) async {
    this.user = user;
    if (this.user == null) {
      //DELETAR do shared preferences
    } else {
      _state = AuthState.authenticated;
      //SALVAR no shared preferences
    }
  }

  void loginUser(User user) {
    _setUser(user);
  }

  void logoutUser() {
    _setUser(null);
  }
}
