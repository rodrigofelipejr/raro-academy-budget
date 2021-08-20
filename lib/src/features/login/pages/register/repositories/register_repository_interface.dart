import 'package:budget/src/shared/models/user_model.dart';

abstract class IRegisterRepository {
  Future<void> createUser(UserModel user);
}
