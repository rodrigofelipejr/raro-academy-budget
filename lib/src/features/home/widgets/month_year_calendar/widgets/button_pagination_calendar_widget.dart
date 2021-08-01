import 'package:flutter/material.dart';

import '../../../../../shared/constants/constants.dart';

class ButtonPaginationCalendarWidget extends StatelessWidget {
  final Function() onTap;
  final bool next;

  const ButtonPaginationCalendarWidget({
    Key? key,
    required this.onTap,
    required this.next,
  }) : super(key: key);

  IconData get icon => next ? Icons.expand_less : Icons.expand_more;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: SizedBox(
        height: kMinInteractiveDimension,
        width: kMinInteractiveDimension,
        child: IconButton(
          onPressed: onTap,
          icon: Icon(icon, color: AppColors.white),
          splashRadius: kMinInteractiveDimension * 0.5,
        ),
      ),
    );
  }
}
