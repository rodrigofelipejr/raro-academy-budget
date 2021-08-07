import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../shared/utils/utils.dart';

class DailyModel {
  final DateTime date;
  final double input;
  final double output;
  final String uuid;

  DailyModel({
    required this.date,
    required this.input,
    required this.output,
    required this.uuid,
  });

  DailyModel copyWith({
    DateTime? date,
    double? input,
    double? output,
    String? uuid,
  }) {
    return DailyModel(
      date: date ?? this.date,
      input: input ?? this.input,
      output: output ?? this.output,
      uuid: uuid ?? this.uuid,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'date': date.millisecondsSinceEpoch,
      'input': input,
      'output': output,
      'uuid': uuid,
    };
  }

  factory DailyModel.fromMap(Map<String, dynamic> map) {
    return DailyModel(
      date: DateTime.fromMillisecondsSinceEpoch(map['date']),
      input: map['input'],
      output: map['output'],
      uuid: map['uuid'],
    );
  }

  factory DailyModel.fromFirestore(DocumentSnapshot doc) {
    Map map = doc.data() as Map<String, dynamic>;

    return DailyModel(
      uuid: map['uuid'] ?? '',
      input: Converters.parseMoneyFromFirebase(map['input']),
      output: Converters.parseMoneyFromFirebase(map['output']),
      date: Dates.parseTimestampDateTime(map['date']) ?? DateTime.now(),
    );
  }

  String toJson() => json.encode(toMap());

  factory DailyModel.fromJson(String source) => DailyModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'DailyModel(date: $date, input: $input, output: $output, uuid: $uuid)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is DailyModel &&
        other.date == date &&
        other.input == input &&
        other.output == output &&
        other.uuid == uuid;
  }

  @override
  int get hashCode {
    return date.hashCode ^ input.hashCode ^ output.hashCode ^ uuid.hashCode;
  }
}
