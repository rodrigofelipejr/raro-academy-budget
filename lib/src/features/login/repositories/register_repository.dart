import 'package:budget/src/features/login/repositories/register_repository_interface.dart';
import 'package:budget/src/shared/constants/app_collections.dart';
import 'package:budget/src/shared/constants/constants.dart';
import 'package:budget/src/shared/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class RegisterRepository extends IRegisterRepository {
  final String _collectionPath = AppCollections.users;
  final FirebaseFirestore firestore;

  RegisterRepository(this.firestore);

  @override
  Future<void> createUser(UserModel user) async {
    Map<String, dynamic> firebaseUser = user.toMap();
    firebaseUser['createAt'] = FieldValue.serverTimestamp();
    await FirebaseFirestore.instance.collection(_collectionPath).add(firebaseUser);
  }
}
