import 'dart:convert';

class User {
  final String cpf;
  final String name;
  final String phone;
  final bool termsAndConditions;
  final String uuid;
  final DateTime? updateAt;
  final DateTime? createAt;

  User({
    required this.cpf,
    required this.name,
    required this.phone,
    required this.termsAndConditions,
    required this.uuid,
    this.updateAt,
    this.createAt,
  });

  User copyWith({
    String? cpf,
    String? name,
    String? phone,
    bool? termsAndConditions,
    String? uuid,
    DateTime? updateAt,
    DateTime? createAt,
  }) {
    return User(
      cpf: cpf ?? this.cpf,
      name: name ?? this.name,
      phone: phone ?? this.phone,
      termsAndConditions: termsAndConditions ?? this.termsAndConditions,
      uuid: uuid ?? this.uuid,
      updateAt: updateAt ?? this.updateAt,
      createAt: createAt ?? this.createAt,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'cpf': cpf,
      'name': name,
      'phone': phone,
      'termsAndConditions': termsAndConditions,
      'uuid': uuid,
      'updateAt': updateAt,
      'createAt': createAt,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      cpf: map['cpf'],
      name: map['name'],
      phone: map['phone'],
      termsAndConditions: map['termsAndConditions'],
      uuid: map['uuid'],
      updateAt: DateTime.fromMillisecondsSinceEpoch(map['updateAt']),
      createAt: DateTime.fromMillisecondsSinceEpoch(map['createAt']),
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));

  @override
  String toString() {
    return 'User(cpf: $cpf, name: $name, phone: $phone, termsAndConditions: $termsAndConditions, uuid: $uuid, updateAt: $updateAt, createAt: $createAt)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is User &&
        other.cpf == cpf &&
        other.name == name &&
        other.phone == phone &&
        other.termsAndConditions == termsAndConditions &&
        other.uuid == uuid &&
        other.updateAt == updateAt &&
        other.createAt == createAt;
  }

  @override
  int get hashCode {
    return cpf.hashCode ^
        name.hashCode ^
        phone.hashCode ^
        termsAndConditions.hashCode ^
        uuid.hashCode ^
        updateAt.hashCode ^
        createAt.hashCode;
  }
}
