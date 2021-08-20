import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/models.dart';
import '../../../shared/models/models.dart';
import '../../../shared/utils/utils.dart';
import '../../../shared/constants/constants.dart';
import 'home_repository.dart';

class HomeRepositoryImpl implements HomeRepository {
  final FirebaseFirestore _firestore;

  HomeRepositoryImpl(this._firestore);

  @override
  Future<DailyModel> getDaily({required String uuid, required int month}) async {
    CollectionReference db = _firestore.collection(AppCollections.daily);

    final snapshot = await db
        .where('uuid', isEqualTo: uuid)
        .where('date', isGreaterThanOrEqualTo: Timestamp.fromDate(Dates.firstDayMonth(month: month)))
        .where('date', isLessThanOrEqualTo: Timestamp.fromDate(Dates.lastDayMonth(month: month)))
        .get();
    final doc = snapshot.size > 0 ? snapshot.docs.first : null;
    return DailyModel.fromFirestore(doc);
  }

  @override
  Future<GeneralBalanceModel> getGeneralBalance(String uuid) async {
    CollectionReference db = _firestore.collection(AppCollections.generalBalance);

    final snapshot = await db.where('uuid', isEqualTo: uuid).get();
    final doc = snapshot.size > 0 ? snapshot.docs.first : null;
    return GeneralBalanceModel.fromFirestore(doc);
  }

  @override
  Future<List<TransactionModel>> getLastTransactionsByUuid(String uuid) async {
    CollectionReference db = _firestore.collection(AppCollections.transactions);

    final snapshot = await db.where('uuid', isEqualTo: uuid).orderBy('createAt', descending: true).limit(3).get();
    return snapshot.docs.map((e) => TransactionModel.fromFirestore(e)).toList();
  }
}
