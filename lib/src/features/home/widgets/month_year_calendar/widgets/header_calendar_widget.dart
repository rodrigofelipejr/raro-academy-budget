import 'package:flutter/material.dart';

import '../../../../../shared/utils/months.dart';
import '../../../../../shared/constants/constants.dart';

import 'button_pagination_calendar_widget.dart';

class HeaderCalendarWidget extends StatefulWidget {
  final DateTime date;
  final void Function() nextYear;
  final void Function() previousYear;

  const HeaderCalendarWidget({
    Key? key,
    required this.date,
    required this.nextYear,
    required this.previousYear,
  }) : super(key: key);

  @override
  _HeaderCalendarWidgetState createState() => _HeaderCalendarWidgetState();
}

class _HeaderCalendarWidgetState extends State<HeaderCalendarWidget> {
  String get monthDescription {
    final index = months.entries.toList().indexWhere((e) => e.value == widget.date.month);
    final month = months.keys.elementAt(index).substring(0, 3);
    return '$month. ${widget.date.year}';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 4.0),
      decoration: BoxDecoration(
        gradient: AppGradients.blueGradientAppBar,
      ),
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '$monthDescription',
            style: AppTextStyles.white14w500Roboto,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '${widget.date.year}',
                style: AppTextStyles.white26w400Roboto,
              ),
              Spacer(),
              ButtonPaginationCalendarWidget(
                next: true,
                onTap: widget.nextYear,
              ),
              ButtonPaginationCalendarWidget(
                next: false,
                onTap: widget.previousYear,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
