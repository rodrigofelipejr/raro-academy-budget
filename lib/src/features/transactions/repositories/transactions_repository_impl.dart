import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../shared/constants/constants.dart';
import '../../../shared/models/models.dart';
import '../../../shared/utils/utils.dart';

import 'transactions_repository.dart';

class TransactionsRepositoryImpl implements TransactionsRepository {
  final FirebaseFirestore _firestore;
  late final CollectionReference _db;

  TransactionsRepositoryImpl(this._firestore) {
    _db = _firestore.collection(AppCollections.transactions);
  }

  @override
  Future<void> createTransaction(TransactionModel transaction) async {
    await _db.add(transaction.toMap());
  }

  @override
  Future<void> deleteTransaction(String docId) async {
    await _db.doc(docId).delete();
  }

  @override
  Future<List<TransactionModel>> getTransactionsByUuid(String uuid) async {
    final snapshot = await _db.where('uuid', isEqualTo: uuid).orderBy('createAt', descending: true).get();
    return snapshot.docs.map((e) => TransactionModel.fromFirestore(e)).toList();
  }

  @override
  Future<List<TransactionModel>> getAllTransactionsByMonth({required String uuid, required int month}) async {
    final snapshot = await _db
        .where('uuid', isEqualTo: uuid)
        .where('createAt', isGreaterThanOrEqualTo: Timestamp.fromDate(Dates.firstDayMonth(month: month)))
        .where('createAt', isLessThanOrEqualTo: Timestamp.fromDate(Dates.lastDayMonth(month: month)))
        .orderBy('createAt', descending: true)
        .get();

    return snapshot.docs.map((e) => TransactionModel.fromFirestore(e)).toList();
  }

  @override
  Future<void> updateTransaction({required String docId, required TransactionModel transaction}) async {
    await _db.doc(docId).set(transaction.toMap(), SetOptions(merge: true));
  }
}
