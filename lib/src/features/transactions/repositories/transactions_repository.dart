import 'package:budget/src/shared/constants/app_collections.dart';
import 'package:budget/src/shared/constants/constants.dart';
import 'package:budget/src/shared/models/transaction_model.dart';
import 'package:budget/src/shared/utils/dates.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'transaction_repository_interface.dart';

class TransactionsRepository implements ITransactionsRepository {
  final String _collectionPath = AppCollections.transactions;
  final FirebaseFirestore firestore;

  TransactionsRepository(this.firestore);

  @override
  Future<String?> createTransaction(TransactionModel transaction) async {
    CollectionReference db =
        FirebaseFirestore.instance.collection(_collectionPath);
    final newTransaction = await db.add(transaction.toMap());
    return newTransaction.id;
  }

  @override
  Future<void> updateTransaction(TransactionModel transaction) async {
    CollectionReference db =
        FirebaseFirestore.instance.collection(_collectionPath);
    db.doc(transaction.id).set(transaction.toMap(), SetOptions(merge: true));
  }

  @override
  Future<void> deleteTransaction(TransactionModel transaction) async {
    CollectionReference db =
        FirebaseFirestore.instance.collection(_collectionPath);
    db.doc(transaction.id).delete();
  }

  @override
  Future<List<TransactionModel>> getTransactions(String uuid) async {
    CollectionReference db =
        FirebaseFirestore.instance.collection(_collectionPath);
    final snapshot = await db
        .where('uuid', isEqualTo: uuid)
        .orderBy('updateAt', descending: true)
        .get();

    return snapshot.docs.map((e) => TransactionModel.fromFirestore(e)).toList();
  }

  @override
  Future<List<TransactionModel>> getTransactionsByMonth(
      {required int month, required String uuid}) async {
    CollectionReference db =
        FirebaseFirestore.instance.collection(_collectionPath);
    final snapshot = await db
        .where('uuid', isEqualTo: uuid)
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

  // Para testes
  Future<void> showTransactions() async {
    final response = await FirebaseFirestore.instance
        .collection(_collectionPath)
        // .where('uuid', isEqualTo: '')
        .where('uuid', isEqualTo: 'bz6QAEAmPTfAM4baxbTWV62BXou1')
        // .where('uuid', isEqualTo: '31KaO9IFxTOY3No1kWfoYyHptiw2')
        .get();
    response.docs.map((e) => print(TransactionModel.fromFirestore(e)));
    print(
        'TRANSACTIONS: ${response.docs.map((e) => TransactionModel.fromFirestore(e))}');
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
