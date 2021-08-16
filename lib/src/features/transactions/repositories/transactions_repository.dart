import 'package:budget/src/shared/constants/app_collections.dart';
import 'package:budget/src/shared/constants/constants.dart';
import 'package:budget/src/shared/models/transaction_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'transaction_repository_interface.dart';

class TransactionsRepository implements ITransactionsRepository {
  final FirebaseFirestore firestore;

  TransactionsRepository(this.firestore);

  @override
  Future<bool> createTransaction(TransactionModel transaction) async {
    try {
      final response = await FirebaseFirestore.instance.collection("/test").add({
        "uuid": transaction.uuid,
        "value": transaction.value,
        "type": transaction.type,
        "description": transaction.description,
        "createdAt": transaction.createAt,
        "updatedAt": transaction.updateAt,
      });
      print("CreateTransaction: $response.docs");
      return true;
    } catch (e) {
      print("ErrorCreateTransaction: $e");
      throw e;
    }
  }

  @override
  Future<bool> deleteTransactions(String uuid) async {
    try {
      await FirebaseFirestore.instance.collection("/test").doc(uuid).delete();
      print("DeleteteTransaction: ");
      return true;
    } catch (e) {
      print("ErrorDeleteTransaction: $e");
      throw e;
    }
  }

  @override
  Future<List<TransactionModel>> getTransactions() async {
    CollectionReference db = FirebaseFirestore.instance.collection(AppCollections.transactions);
    final snapshot =
        await db.where('uuid', isEqualTo: AppSettings.userUuid).orderBy('createAt', descending: true).get();

    return snapshot.docs.map((e) => TransactionModel.fromFirestore(e)).toList();
  }

  @override
  Future<bool> updateTransactions(TransactionModel transaction) async {
    try {
      await FirebaseFirestore.instance.collection("/test").doc("asdf").set({
        "uuid": transaction.uuid,
        "value": transaction.value,
        "type": transaction.type,
        "description": transaction.description,
        "createdAt": transaction.createAt,
        "updatedAt": transaction.updateAt,
      }, SetOptions(merge: true));
      print("UpdateTransaction: ");
      return true;
    } catch (e) {
      print("ErrorUpdateTransaction: $e");
      throw e;
    }
  }
}
