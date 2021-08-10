import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'widgets/header_calendar_widget.dart';
import 'widgets/body_calendar_widget.dart';

class MonthYearCalendarWidget extends StatefulWidget {
  final DateTime? referenceDate;

  const MonthYearCalendarWidget({
    Key? key,
    this.referenceDate,
  }) : super(key: key);

  @override
  _MonthYearCalendarWidgetState createState() => _MonthYearCalendarWidgetState();
}

class _MonthYearCalendarWidgetState extends State<MonthYearCalendarWidget> {
  late DateTime _selected;

  @override
  void initState() {
    super.initState();
    final date = widget.referenceDate ?? DateTime.now();
    _selected = DateTime(date.year, date.month, 15);
  }

  void nextYear() {
    _selected = _selected.add(Duration(days: 365));
    setState(() {});
  }

  void previousYear() {
    _selected = _selected.add(Duration(days: -365));
    setState(() {});
  }

  void updateMonth(int month) {
    _selected = DateTime(_selected.year, month, 15);
    Modular.to.pop(_selected);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: EdgeInsets.all(16.0),
        height: MediaQuery.of(context).size.height * 0.65,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16.0),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.0),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                HeaderCalendarWidget(
                  date: _selected,
                  nextYear: nextYear,
                  previousYear: previousYear,
                ),
                Expanded(
                  child: BodyCalendarWidget(
                    date: _selected,
                    updateMonth: (int value) => updateMonth(value),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
