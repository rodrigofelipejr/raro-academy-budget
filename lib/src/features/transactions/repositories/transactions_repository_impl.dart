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
  Future<String> createTransaction(TransactionModel transaction) async {
    final snapshot = await _db.add(transaction.toMap());
    return snapshot.id;
  }

  @override
  Future<void> updateTransaction(TransactionModel transaction) async {
    await _db.doc(transaction.id).set(transaction.toMap(), SetOptions(merge: true));
  }

  @override
  Future<void> deleteTransaction(String docId) async {
    await _db.doc(docId).delete();
  }

  @override
  Future<List<TransactionModel>> getTransactionsByUuid(String uuid) async {
    final snapshot = await _db.where('uuid', isEqualTo: uuid).orderBy('date', descending: true).get();
    return snapshot.docs.map((e) => TransactionModel.fromFirestore(e)).toList();
  }

  @override
  Future<List<TransactionModel>> getAllTransactionsByMonth({required String uuid, required int month}) async {
    final snapshot = await _db
        .where('uuid', isEqualTo: uuid)
        .where('date', isGreaterThanOrEqualTo: Timestamp.fromDate(Dates.firstDayMonth(month: month)))
        .where('date', isLessThanOrEqualTo: Timestamp.fromDate(Dates.lastDayMonth(month: month)))
        .orderBy('date', descending: true)
        .get();

    return snapshot.docs.map((e) => TransactionModel.fromFirestore(e)).toList();
  }

  // Para testes
  Future<void> showTransactions() async {
    final response = await _db.get();
    print('TRANSACTIONS: ${response.docs.map(((e) => e.data()))}');
    print(response);
  }

  // Para testes
  Future<void> showDocs() async {
    final response = await _db.get().then((value) => value.docs.map((doc) => doc.id));
    print('DOCS[${response.length}]: ${response.toList()}');
  }
}
