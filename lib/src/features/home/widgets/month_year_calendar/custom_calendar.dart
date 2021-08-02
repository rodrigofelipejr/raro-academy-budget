import 'model/calendar_model.dart';

class CustomCalendar {
  static bool _isLeapYear(int year) {
    if (year % 4 == 0) {
      if (year % 100 == 0) {
        if (year % 400 == 0) return true;
        return false;
      }
      return true;
    }
    return false;
  }

  static List<CalendarModel> getMonthCalendar(int month, int year) {
    List<CalendarModel> calendar = [];

    final List<int> _monthDays = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];
    int otherYear;
    int otherMonth;
    int leftDays;

    int totalDays = _monthDays[month - 1];
    if (_isLeapYear(year) && month == DateTime.february) totalDays++;

    for (int i = 0; i < totalDays; i++) {
      calendar.add(
        CalendarModel(
          date: DateTime(year, month, i + 1),
          thisMonth: true,
        ),
      );
    }

    if (month == DateTime.december) {
      otherMonth = DateTime.january;
      otherYear = year + 1;
    } else {
      otherMonth = month + 1;
      otherYear = year;
    }

    leftDays = 7 - calendar.last.date.weekday - 0;
    if (leftDays == -1) leftDays = 6;

    for (int i = 0; i < leftDays; i++) {
      calendar.add(
        CalendarModel(
          date: DateTime(otherYear, otherMonth, i + 1),
          nextMonth: true,
        ),
      );
    }

    return calendar;
  }
}
