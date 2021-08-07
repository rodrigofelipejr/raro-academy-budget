import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/models.dart';
import '../../../shared/models/models.dart';
import '../../../shared/utils/utils.dart';
import '../../../shared/constants/constants.dart';

class HomeRepository {
  Future<GeneralBalanceModel> getGeneralBalance() async {
    CollectionReference db = FirebaseFirestore.instance.collection(AppCollections.generalBalance);
    final snapshot = await db.where('uuid', isEqualTo: AppSettings.userUuid).get();
    return GeneralBalanceModel.fromFirestore(snapshot.docs.first);
  }

  Future<DailyModel> getDaily(int month) async {
    CollectionReference db = FirebaseFirestore.instance.collection(AppCollections.daily);

    final snapshot = await db
        .where('uuid', isEqualTo: AppSettings.userUuid)
        .where('date', isGreaterThanOrEqualTo: Timestamp.fromDate(Dates.firstDayMonth(month: month)))
        .where('date', isLessThanOrEqualTo: Timestamp.fromDate(Dates.lastDayMonth(month: month)))
        .get();

    return DailyModel.fromFirestore(snapshot.docs.first);
  }

  Future<List<TransactionModel>> getLastTransactions() async {
    CollectionReference db = FirebaseFirestore.instance.collection(AppCollections.transactions);
    final snapshot =
        await db.where('uuid', isEqualTo: AppSettings.userUuid).orderBy('createAt', descending: true).limit(3).get();
    return snapshot.docs.map((e) => TransactionModel.fromFirestore(e)).toList();
  }
}
