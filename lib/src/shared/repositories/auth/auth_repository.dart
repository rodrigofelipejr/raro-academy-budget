import 'package:cloud_firestore/cloud_firestore.dart';

import '../../models/user_model.dart';
import '../../../shared/constants/constants.dart';

class AuthRepository {
  final FirebaseFirestore firebaseFirestore;

  AuthRepository(this.firebaseFirestore);

  Future<UserModel> getUser(String uuid) async {
    CollectionReference db = firebaseFirestore.collection(AppCollections.users);
    final snapshot = await db.where('uuid', isEqualTo: uuid).get();
    final doc = snapshot.size > 0 ? snapshot.docs.first : null;
    return UserModel.fromFirestore(doc);
  }
}
