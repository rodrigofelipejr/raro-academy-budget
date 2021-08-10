import 'package:flutter/material.dart';

import '../constants/constants.dart';
import 'widgets.dart';

class MonthSelectorWidget extends StatelessWidget {
  final String label;
  final DateTime referenceDate;
  final void Function(DateTime date) changeSelectedDate;
  final bool flatStyle;

  const MonthSelectorWidget({
    Key? key,
    required this.label,
    required this.referenceDate,
    required this.changeSelectedDate,
    this.flatStyle = false,
  }) : super(key: key);

  BorderRadius get borderRadius => BorderRadius.circular(34.0);

  _buildMonthYearSelector(context) async {
    final DateTime? date = await showDialog(
      barrierColor: Colors.black87,
      context: context,
      builder: (_) => MonthYearCalendarWidget(
        referenceDate: referenceDate,
      ),
    );

    if (date != null) changeSelectedDate(date);
  }

  BoxDecoration get decoration => !flatStyle
      ? BoxDecoration(
          borderRadius: borderRadius,
          color: AppColors.white.withOpacity(0.1),
        )
      : BoxDecoration(
          gradient: AppGradients.blueGradientButtons,
          borderRadius: borderRadius,
          boxShadow: AppShadows.shadowsButtons,
        );

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: decoration,
      child: Material(
        borderRadius: borderRadius,
        color: AppColors.transparent,
        child: InkWell(
          borderRadius: borderRadius,
          onTap: () => _buildMonthYearSelector(context),
          child: Container(
            padding: const EdgeInsets.fromLTRB(14.0, 6.0, 8.0, 6.0),
            child: Row(
              children: [
                Text(
                  label.toUpperCase(),
                  style: AppTextStyles.white14w500Roboto,
                ),
                Icon(
                  Icons.expand_more,
                  color: AppColors.white,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
