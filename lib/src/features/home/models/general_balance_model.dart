import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../shared/utils/utils.dart';

class GeneralBalanceModel {
  final double balance;
  final String uuid;

  GeneralBalanceModel({
    required this.balance,
    required this.uuid,
  });

  GeneralBalanceModel copyWith({
    double? balance,
    String? uuid,
  }) {
    return GeneralBalanceModel(
      balance: balance ?? this.balance,
      uuid: uuid ?? this.uuid,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'balance': balance,
      'uuid': uuid,
    };
  }

  factory GeneralBalanceModel.fromMap(Map<String, dynamic> map) {
    return GeneralBalanceModel(
      balance: map['balance'],
      uuid: map['uuid'],
    );
  }

  factory GeneralBalanceModel.fromFirestore(DocumentSnapshot doc) {
    Map map = doc.data() as Map<String, dynamic>;

    return GeneralBalanceModel(
      uuid: map['uuid'] ?? '',
      balance: Converters.parseMoneyFromFirebase(map['balance']),
    );
  }

  String toJson() => json.encode(toMap());

  factory GeneralBalanceModel.fromJson(String source) => GeneralBalanceModel.fromMap(json.decode(source));

  @override
  String toString() => 'GeneralBalanceModel(balance: $balance, uuid: $uuid)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is GeneralBalanceModel && other.balance == balance && other.uuid == uuid;
  }

  @override
  int get hashCode => balance.hashCode ^ uuid.hashCode;
}
