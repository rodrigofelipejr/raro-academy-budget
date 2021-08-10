import 'package:cloud_firestore/cloud_firestore.dart';

class TransactionDailyModel {
  int? category;
  DateTime? date;
  String? description;
  int? type;
  int? value;
  final DocumentReference? reference;

  TransactionDailyModel(
      {this.reference,
      this.category,
      this.date,
      this.description,
      this.type,
      this.value});

  factory TransactionDailyModel.fromDocument(DocumentSnapshot doc) {
    return TransactionDailyModel(
        category: doc['category'],
        date: doc['createAt'],
        description: doc['description'],
        type: doc['type'],
        value: doc['value'],
        reference: doc.reference);
  }
}
