import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/transaction_model.dart';

class TransactionsRepository {
  Future<bool> createTransaction(TransactionModel transaction) async {
    try {
      final response =
          await FirebaseFirestore.instance.collection("/test").add({
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

  Future<bool> deleteTransaction(String docId) async {
    try {
      await FirebaseFirestore.instance
          .collection("/test")
          .doc(docId)
          .delete();
      print("DeleteteTransaction: ");
      return true;
    } catch (e) {
      print("ErrorDeleteTransaction: $e");
      throw e;
    }
  }

  Future<bool> updateTransaction(TransactionModel transaction) async {
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

  Future<bool> getTransactions() async {
    try {
      final response =
          await FirebaseFirestore.instance.collection("/test").get();
      print('Transactions: ${response.docs.map(((e) => e.data()))}');
      print(response);
      return true;
    } catch (e) {
      print('ErrorTransactions: $e');
      throw e;
    }
  }

  Future<bool> getDocs() async {
    try {
      final response = await FirebaseFirestore.instance
          .collection("/test")
          .get()
          .then((value) => value.docs.map((doc) => doc.id));
      print(response.toList());
      print(response.length);
      return true;
    } catch (e) {
      print('ErrorTransactions: $e');
      throw e;
    }
  }
}
