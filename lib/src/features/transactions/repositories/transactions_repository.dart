import 'package:budget/src/shared/constants/app_collections.dart';
import 'package:budget/src/shared/constants/constants.dart';
import 'package:budget/src/shared/models/transaction_model.dart';
import 'package:budget/src/shared/utils/dates.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'transaction_repository_interface.dart';

class TransactionsRepository implements ITransactionsRepository {
  // final String _collectionPath = "/test";
  final String _collectionPath = AppCollections.transactions;
  final FirebaseFirestore firestore;

  TransactionsRepository(this.firestore);

  @override
  Future<void> createTransaction(TransactionModel transaction) async {
    await FirebaseFirestore.instance
      .collection(_collectionPath)
      .add(transaction.toMap());
  }

  @override
  Future<void> deleteTransaction(String uuid) async {
    await FirebaseFirestore.instance.collection(_collectionPath).doc(uuid).delete();
  }

  @override
  Future<List<TransactionModel>> getTransactionsByMonth(int month) async {
    CollectionReference db =
        FirebaseFirestore.instance.collection(_collectionPath);
    final snapshot = await db
        .where('uuid', isEqualTo: AppSettings.userUuid)
        .where('createAt',
            isGreaterThanOrEqualTo:
                Timestamp.fromDate(Dates.firstDayMonth(month: month)))
        .where('createAt',
            isLessThanOrEqualTo:
                Timestamp.fromDate(Dates.lastDayMonth(month: month)))
        .orderBy('createAt', descending: true)
        .get();

    return snapshot.docs.map((e) => TransactionModel.fromFirestore(e)).toList();
  }

  @override
  Future<void> updateTransaction(TransactionModel transaction, String docId) async {
    await FirebaseFirestore.instance
      .collection(_collectionPath)
      .doc(docId)
      .set(transaction.toMap(), SetOptions(merge: true));
  }

  // Para testes
  Future<void> showTransactions() async {
    final response = await FirebaseFirestore.instance.collection(_collectionPath).get();
    print('TRANSACTIONS: ${response.docs.map(((e) => e.data()))}');
    print(response);
  }

  // Para testes
  Future<void> showDocs() async {
    final response = await FirebaseFirestore.instance
      .collection(_collectionPath)
      .get()
      .then((value) => value.docs.map((doc) => doc.id));
    print('DOCS[${response.length}]: ${response.toList()}');
  }
}
