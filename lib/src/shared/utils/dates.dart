import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

import 'utils.dart';

class Dates {
  static DateTime firstDayMonth({int? year, int? month}) {
    final now = DateTime.now();

    if (year == null) year = now.year;
    if (month == null) month = now.month;

    return DateTime(year, month, 1);
  }

  static DateTime lastDayMonth({int? year, int? month}) {
    DateTime now = DateTime.now();

    if (year == null) year = now.year;
    if (month == null) month = now.month;

    int lastDay = DateTime(year, month + 1, 0).day;
    return DateTime(year, month, lastDay, 23, 59, 59, 999);
  }

  static DateTime? parseTimestampDateTime(Timestamp? timestamp) {
    return timestamp != null ? timestamp.toDate() : null;
  }

  static String descriptionMonth(int monthNumber) {
    return months.entries.toList().elementAt(--monthNumber).key;
  }

  static String parseDateTimeToString(DateTime date) {
    return DateFormat("dd/MM/yyyy").format(date);
  }
}
