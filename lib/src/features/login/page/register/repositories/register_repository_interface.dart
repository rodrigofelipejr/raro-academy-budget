import 'package:budget/src/features/login/page/models/models.dart';

abstract class IRegisterRepository {
  Future<void> createUser(User user);
}
