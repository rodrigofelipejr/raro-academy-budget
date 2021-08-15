import 'dart:convert';

import 'package:budget/src/shared/utils/utils.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class TransactionModel {
  final String uuid;
  final String category;
  final String type;
  final String? description;
  final double value;
  final DateTime createAt;
  final DateTime updateAt;

  TransactionModel({
    required this.uuid,
    required this.category,
    required this.type,
    this.description,
    required this.value,
    required this.createAt,
    required this.updateAt,
  });

  TransactionModel copyWith({
    String? uuid,
    String? category,
    String? type,
    String? description,
    double? value,
    DateTime? createAt,
    DateTime? updateAt,
  }) {
    return TransactionModel(
      uuid: uuid ?? this.uuid,
      category: category ?? this.category,
      type: type ?? this.type,
      description: description ?? this.description,
      value: value ?? this.value,
      createAt: createAt ?? this.createAt,
      updateAt: updateAt ?? this.updateAt,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'uuid': uuid,
      'category': category,
      'type': type,
      'description': description,
      'value': value,
      'createAt': createAt.millisecondsSinceEpoch,
      'updateAt': updateAt.millisecondsSinceEpoch,
    };
  }

  factory TransactionModel.fromMap(Map<String, dynamic> map) {
    return TransactionModel(
      uuid: map['uuid'],
      category: map['category'],
      type: map['type'],
      description: map['description'],
      value: map['value'],
      createAt: DateTime.fromMillisecondsSinceEpoch(map['createAt']),
      updateAt: DateTime.fromMillisecondsSinceEpoch(map['updateAt']),
    );
  }

  factory TransactionModel.fromFirestore(DocumentSnapshot doc) {
    Map map = doc.data() as Map<String, dynamic>;

    return TransactionModel(
      uuid: map['uuid'] ?? '',
      category: map['category'] ?? '',
      type: map['type'] ?? '',
      description: map['description'] ?? '',
      value: Converters.parseMoneyFromFirebase(map['value']),
      createAt: Dates.parseTimestampDateTime(map['createAt']) ?? DateTime.now(),
      updateAt: Dates.parseTimestampDateTime(map['updateAt']) ?? DateTime.now(),
    );
  }

  String toJson() => json.encode(toMap());

  factory TransactionModel.fromJson(String source) => TransactionModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'TransactionModel(uuid: $uuid, category: $category, type: $type, description: $description, value: $value, createAt: $createAt, updateAt: $updateAt)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is TransactionModel &&
        other.uuid == uuid &&
        other.category == category &&
        other.type == type &&
        other.description == description &&
        other.value == value &&
        other.createAt == createAt &&
        other.updateAt == updateAt;
  }

  @override
  int get hashCode {
    return uuid.hashCode ^
        category.hashCode ^
        type.hashCode ^
        description.hashCode ^
        value.hashCode ^
        createAt.hashCode ^
        updateAt.hashCode;
  }
}
