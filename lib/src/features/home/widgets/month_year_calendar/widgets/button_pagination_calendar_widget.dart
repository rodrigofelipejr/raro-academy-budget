import 'package:flutter/material.dart';
import 'package:flutter_finance_controller/src/shared/constants/constants.dart';

class ButtonPaginationCalendarWidget extends StatelessWidget {
  final Function() onTap;
  final bool next;

  const ButtonPaginationCalendarWidget({
    Key? key,
    required this.onTap,
    required this.next,
  }) : super(key: key);

  double get size => 48;
  BorderRadius? get borderRadius => BorderRadius.circular(size);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        gradient: AppGradients.blueGradientButtons,
        shape: BoxShape.circle,
        // boxShadow: AppShadows.shadowsFab, //NOTE - verificar
      ),
      child: Material(
        color: AppColors.transparent,
        borderRadius: borderRadius,
        child: InkWell(
          borderRadius: borderRadius,
          onTap: onTap,
          child: SizedBox(
            width: size,
            height: size,
            child: Center(
              child: Icon(
                next ? Icons.chevron_right : Icons.chevron_left,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
