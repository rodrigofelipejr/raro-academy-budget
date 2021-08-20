import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/models.dart';
import '../../../shared/models/models.dart';
import '../../../shared/utils/utils.dart';
import '../../../shared/constants/constants.dart';

class HomeRepository {
  Future<GeneralBalanceModel> getGeneralBalance({required String uuid}) async {
    CollectionReference db = FirebaseFirestore.instance.collection(AppCollections.generalBalance);

    final snapshot = await db.where('uuid', isEqualTo: uuid).get();

    final doc = snapshot.size > 0 ? snapshot.docs.first : null;
    return GeneralBalanceModel.fromFirestore(doc);
  }

  Future<DailyModel> getDaily({required String uuid, required int month}) async {
    CollectionReference db = FirebaseFirestore.instance.collection(AppCollections.daily);

    final snapshot = await db
        .where('uuid', isEqualTo: uuid)
        .where('date', isGreaterThanOrEqualTo: Timestamp.fromDate(Dates.firstDayMonth(month: month)))
        .where('date', isLessThanOrEqualTo: Timestamp.fromDate(Dates.lastDayMonth(month: month)))
        .get();

    final doc = snapshot.size > 0 ? snapshot.docs.first : null;
    return DailyModel.fromFirestore(doc);
  }

  Future<List<TransactionModel>> getLastTransactions({required String uuid}) async {
    CollectionReference db = FirebaseFirestore.instance.collection(AppCollections.transactions);
    final snapshot = await db.where('uuid', isEqualTo: uuid).orderBy('createAt', descending: true).limit(3).get();

    return snapshot.docs.map((e) => TransactionModel.fromFirestore(e)).toList();
  }
}
