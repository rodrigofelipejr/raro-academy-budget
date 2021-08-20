import 'package:cloud_firestore/cloud_firestore.dart';

import '../../models/user_model.dart';

abstract class AuthRepository {
  Future<UserModel> getUser(String uuid);
}
