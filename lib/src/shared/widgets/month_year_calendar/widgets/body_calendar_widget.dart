import 'package:flutter/material.dart';

import '../../../utils/utils.dart';
import '../../../constants/constants.dart';

class BodyCalendarWidget extends StatefulWidget {
  final DateTime date;
  final void Function(int value) updateMonth;

  const BodyCalendarWidget({
    Key? key,
    required this.date,
    required this.updateMonth,
  }) : super(key: key);

  @override
  _BodyCalendarWidgetState createState() => _BodyCalendarWidgetState();
}

class _BodyCalendarWidgetState extends State<BodyCalendarWidget> {
  int get month => widget.date.month;
  BorderRadius get borderRadius => BorderRadius.circular(100);
  int get selectedIndex => months.entries.toList().indexWhere((e) => e.value == widget.date.month);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.white,
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: GridView.builder(
        shrinkWrap: true,
        itemCount: months.length,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          mainAxisSpacing: 8.0,
          crossAxisSpacing: 4.0,
        ),
        padding: const EdgeInsets.all(1.0),
        itemBuilder: (context, index) {
          bool selected = selectedIndex == index;

          return Material(
            color: AppColors.transparent,
            borderRadius: borderRadius,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 250),
              curve: Curves.easeIn,
              decoration: BoxDecoration(
                color: selected ? AppColors.ciano : AppColors.transparent,
                borderRadius: borderRadius,
              ),
              child: InkWell(
                borderRadius: borderRadius,
                onTap: () => widget.updateMonth(months.values.elementAt(index)),
                child: Center(
                  child: Text(
                    '${months.keys.elementAt(index).substring(0, 3)}',
                    style: AppTextStyles.black16w400Roboto.copyWith(
                      fontWeight: selected ? FontWeight.w500 : FontWeight.w400,
                      color: selected ? AppColors.white : AppTextStyles.black16w400Roboto.color,
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
