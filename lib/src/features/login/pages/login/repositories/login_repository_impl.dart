import 'package:firebase_auth/firebase_auth.dart';

import 'login_repository.dart';

class LoginRepositoryImpl extends LoginRepository {
  final FirebaseAuth _firebaseAuth;

  LoginRepositoryImpl(this._firebaseAuth);

  @override
  Future<UserCredential> signInWithEmailAndPassword({required String email, required String password}) async {
    return await _firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }
}
