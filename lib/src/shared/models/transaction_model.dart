import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

import '../utils/utils.dart';

enum TypeTransaction { output, input }

class TransactionModel {
  final String? id;
  final String? uuid;
  final String category;
  final TypeTransaction type;
  final String? description;
  final double value;
  final DateTime date;
  final DateTime? createAt;
  final DateTime? updateAt;

  TransactionModel({
    this.id,
    this.uuid,
    required this.category,
    required this.type,
    this.description,
    required this.value,
    required this.date,
    this.createAt,
    this.updateAt,
  });

  TransactionModel copyWith({
    String? id,
    String? uuid,
    String? category,
    TypeTransaction? type,
    String? description,
    double? value,
    DateTime? date,
    DateTime? createAt,
    DateTime? updateAt,
  }) {
    return TransactionModel(
      id: id ?? this.id,
      uuid: uuid ?? this.uuid,
      category: category ?? this.category,
      type: type ?? this.type,
      description: description ?? this.description,
      value: value ?? this.value,
      date: date ?? this.date,
      createAt: createAt ?? this.createAt,
      updateAt: updateAt ?? this.updateAt,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'uuid': uuid,
      'category': category,
      'type': TypeTransaction.values.indexOf(type),
      'description': description,
      'value': value,
      'date': date,
      'createAt': createAt,
      'updateAt': updateAt,
    };
  }

  factory TransactionModel.fromMap(Map<String, dynamic> map) {
    return TransactionModel(
      id: map['id'],
      uuid: map['uuid'],
      category: map['category'],
      type: TypeTransaction.values[map['type']],
      description: map['description'],
      value: map['value'],
      date: DateTime.fromMillisecondsSinceEpoch(map['date']),
      createAt: DateTime.fromMillisecondsSinceEpoch(map['createAt']),
      updateAt: DateTime.fromMillisecondsSinceEpoch(map['updateAt']),
    );
  }

  String toJson() => json.encode(toMap());

  factory TransactionModel.fromJson(String source) => TransactionModel.fromMap(json.decode(source));

  factory TransactionModel.fromFirestore(DocumentSnapshot doc) {
    Map map = doc.data() as Map<String, dynamic>;

    return TransactionModel(
      id: doc.id,
      uuid: map['uuid'] ?? '',
      category: map['category'] ?? '',
      type: TypeTransaction.values[map['type'] ?? 0],
      description: map['description'],
      value: Converters.parseMoneyFromFirebase(map['value']),
      createAt: Dates.parseTimestampDateTime(map['createAt']) ?? DateTime.now(),
      updateAt: Dates.parseTimestampDateTime(map['updateAt']) ?? DateTime.now(),
      date: Dates.parseTimestampDateTime(map['date']) ?? DateTime.now(),
    );
  }

  @override
  String toString() {
    return 'TransactionModel(id: $id, uuid: $uuid, category: $category, type: $type, description: $description, value: $value, date: $date, createAt: $createAt, updateAt: $updateAt)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is TransactionModel &&
        other.id == id &&
        other.uuid == uuid &&
        other.category == category &&
        other.type == type &&
        other.description == description &&
        other.value == value &&
        other.date == date &&
        other.createAt == createAt &&
        other.updateAt == updateAt;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        uuid.hashCode ^
        category.hashCode ^
        type.hashCode ^
        description.hashCode ^
        value.hashCode ^
        date.hashCode ^
        createAt.hashCode ^
        updateAt.hashCode;
  }
}
