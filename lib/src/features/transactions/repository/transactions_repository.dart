import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/transaction_data.dart';

class TransactionsRepository {
  Future<bool> createTransaction(TransactionData transaction) async {
    try {
      final response =
          await FirebaseFirestore.instance.collection("/test").add({
        "uid": transaction.uid,
        "value": transaction.value,
        "type": transaction.type,
        "name": transaction.name,
        "createdAt": transaction.date,
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
      final response = await FirebaseFirestore.instance
          .collection("/test")
          .doc(docId)
          .delete();
      print("DeleteteTransaction:");
      return true;
    } catch (e) {
      print("ErrorDeleteTransaction: $e");
      throw e;
    }
  }

  Future<bool> updateTransaction(TransactionData transaction) async {
    try {
      final response =
          await FirebaseFirestore.instance.collection("/test").doc("asdf").set({
        "uid": transaction.uid,
        "value": transaction.value,
        "type": transaction.type,
        "name": transaction.name,
        "createdAt": transaction.date,
      }, SetOptions(merge: true));
      // print("UpdateTransaction: $response.docs");
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
}
