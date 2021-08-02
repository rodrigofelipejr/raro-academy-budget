import 'package:flutter/material.dart';

import 'custom_calendar.dart';
import 'utils/enums.dart';
import 'model/calendar_model.dart';
import 'utils/constants.dart';
import 'widgets/button_pagination_calendar_widget.dart';
import '../../../../shared/constants/constants.dart';

class MonthYearCalendarWidget extends StatefulWidget {
  const MonthYearCalendarWidget({Key? key}) : super(key: key);

  @override
  _MonthYearCalendarWidgetState createState() => _MonthYearCalendarWidgetState();
}

class _MonthYearCalendarWidgetState extends State<MonthYearCalendarWidget> {
  late DateTime _currentDateTime;
  late DateTime _selectedDateTime;
  late List<CalendarModel> _partsDates;
  int _referenceYear = DateTime.now().year;
  CalendarViews _currentView = CalendarViews.months;

  @override
  void initState() {
    super.initState();
    final date = DateTime.now();

    _currentDateTime = DateTime(date.year, date.month);
    _selectedDateTime = DateTime(date.year, date.month, date.day);

    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      setState(() => _buildCalendar());
    });
  }

  void _buildCalendar() {
    _partsDates = CustomCalendar.getMonthCalendar(_currentDateTime.month, _currentDateTime.year);
  }

  // months list
  Widget _showMonthsList() {
    return Material(
      color: AppColors.transparent,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          InkWell(
            onTap: () => setState(() => _currentView = CalendarViews.year),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '${_currentDateTime.year}',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w700,
                      color: AppColors.roxo,
                    ),
                  ),
                  Icon(
                    Icons.expand_more,
                    color: AppColors.gray,
                  ),
                ],
              ),
            ),
          ),
          Container(height: 2.0, color: AppColors.gray),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.zero,
              itemCount: months.length,
              itemBuilder: (context, index) => ListTile(
                onTap: () {
                  _currentDateTime = DateTime(_currentDateTime.year, index + 1);
                  _buildCalendar();
                  Navigator.of(context).pop(_currentDateTime.toString());
                },
                title: Center(
                  child: Text(
                    months.keys.elementAt(index),
                    style: TextStyle(
                        fontSize: 18, color: (index == _currentDateTime.month - 1) ? AppColors.ciano : AppColors.roxo),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // years list
  Widget _showYearsList(int referenceYear) {
    return Material(
      color: AppColors.transparent,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ButtonPaginationCalendarWidget(
                next: false,
                onTap: () {
                  if (_currentView == CalendarViews.year) {
                    _referenceYear -= 9;
                    setState(() {});
                  }
                },
              ),
              ButtonPaginationCalendarWidget(
                next: true,
                onTap: () {
                  if (_currentView == CalendarViews.year) {
                    _referenceYear += 9;
                    setState(() {});
                  }
                },
              ),
            ],
          ),
          Expanded(
            child: Container(
              // color: Colors.blue,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: GridView.builder(
                  shrinkWrap: true,
                  itemCount: 9,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
                  itemBuilder: (context, index) {
                    int year;

                    if (index < 4) {
                      year = referenceYear - (4 - index);
                    } else if (index > 4) {
                      year = referenceYear + (index - 4);
                    } else {
                      year = referenceYear;
                    }

                    return ListTile(
                      onTap: () {
                        _currentDateTime = DateTime(year, _currentDateTime.month);
                        _buildCalendar();
                        setState(() => _currentView = CalendarViews.months);
                      },
                      title: Center(
                        child: Text(
                          '$year',
                          style: TextStyle(
                            fontSize: 18,
                            color: (year == _currentDateTime.year) ? AppColors.ciano : AppColors.gray,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: EdgeInsets.all(16.0),
        height: MediaQuery.of(context).size.height * 0.7,
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: (_currentView == CalendarViews.months) ? _showMonthsList() : _showYearsList(_referenceYear),
        // child: _showYearsList(referenceYear),
      ),
    );
  }
}
