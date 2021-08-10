import 'package:budget/src/features/daily/models/transaction_model.dart';
import 'package:budget/src/features/daily/repositories/daily_repository_interface.dart';
import 'package:budget/src/shared/constants/app_collections.dart';
import 'package:budget/src/shared/constants/app_settings.dart';
import 'package:budget/src/shared/models/models.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DailyRepository implements IDailyRepository {
  final FirebaseFirestore firestore;

  DailyRepository(this.firestore);

  // @override
  // Stream<List<TransactionDailyModel>> getTransactions() {
  //   CollectionReference db =
  //       FirebaseFirestore.instance.collection(AppCollections.transactions);
  //   return firestore
  //       .collection(AppCollections.transactions)
  //       .snapshots()
  //       .map((query) {
  //     return query.docs.map((doc) {
  //       return TransactionDailyModel.fromDocument(doc);
  //     }).toList();
  //   });
  // }

  Future<List<TransactionModel>> getTransactions() async {
    CollectionReference db =
        FirebaseFirestore.instance.collection(AppCollections.transactions);
    final snapshot = await db
        .where('uuid', isEqualTo: AppSettings.userUuid)
        .orderBy('createAt', descending: true)
        .get();

    return snapshot.docs.map((e) => TransactionModel.fromFirestore(e)).toList();
  }
}
