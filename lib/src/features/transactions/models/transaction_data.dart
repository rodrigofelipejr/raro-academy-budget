import 'dart:convert';

class TransactionData {
  final double value;
  final String type;
  final String? name;
  final DateTime date;
  final String uid;

  TransactionData({
    required this.value,
    required this.type,
    this.name,
    required this.date,
    required this.uid,
  });

  TransactionData copyWith({
    double? value,
    String? type,
    String? name,
    DateTime? date,
    String? uid,
  }) {
    return TransactionData(
      value: value ?? this.value,
      type: type ?? this.type,
      name: name ?? this.name,
      date: date ?? this.date,
      uid: uid ?? this.uid,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'value': value,
      'type': type,
      'name': name,
      'date': date,
      'uid': uid,
    };
  }

  factory TransactionData.fromMap(Map<String, dynamic> map) {
    return TransactionData(
      value: map['value'],
      type: map['type'],
      name: map['name'],
      date: map['date'],
      uid: map['uid'],
    );
  }

  String toJson() => json.encode(toMap());

  factory TransactionData.fromJson(String source) =>
      TransactionData.fromMap(json.decode(source));

  @override
  String toString() {
    return 'TransactionData(value: $value, type: $type, name: $name, date: $date, uid: $uid)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is TransactionData && other.type == type;
  }

  @override
  int get hashCode {
    return value.hashCode ^
    type.hashCode ^
    date.hashCode ^
    uid.hashCode;
  }
}
