import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../shared/constants/constants.dart';
import '../../../shared/models/models.dart';
import '../../../shared/utils/utils.dart';
import 'home_repository.dart';

class HomeRepositoryImpl implements HomeRepository {
  final FirebaseFirestore _firestore;
  late final CollectionReference _db;

  HomeRepositoryImpl(this._firestore) {
    _db = _firestore.collection(AppCollections.transactions);
  }

  @override
  Future<List<TransactionModel>> getDaily({required String uuid, required int month}) async {
    final snapshot = await _db
        .where('uuid', isEqualTo: uuid)
        .where('createAt', isGreaterThanOrEqualTo: Timestamp.fromDate(Dates.firstDayMonth(month: month)))
        .where('createAt', isLessThanOrEqualTo: Timestamp.fromDate(Dates.lastDayMonth(month: month)))
        .get();
    return snapshot.docs.map((e) => TransactionModel.fromFirestore(e)).toList();
  }

  @override
  Future<List<TransactionModel>> getLastTransactionsByUuid(String uuid) async {
    final snapshot = await _db.where('uuid', isEqualTo: uuid).orderBy('createAt', descending: true).limit(3).get();
    return snapshot.docs.map((e) => TransactionModel.fromFirestore(e)).toList();
  }

  @override
  Future<List<TransactionModel>> getTransactionsByUuid(String uuid) async {
    final snapshot = await _db.where('uuid', isEqualTo: uuid).get();
    return snapshot.docs.map((e) => TransactionModel.fromFirestore(e)).toList();
  }
}
