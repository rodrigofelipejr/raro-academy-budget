import 'package:flutter/material.dart';

import '../constants/constants.dart';

class ButtonIconVisibleWidget extends StatelessWidget {
  final Color colorIcon;
  final void Function() onTap;
  final bool showing;

  const ButtonIconVisibleWidget({
    Key? key,
    required this.onTap,
    required this.showing,
    this.colorIcon = AppColors.roxo,
  }) : super(key: key);

  IconData get icon => showing ? Icons.visibility : Icons.visibility_off;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: SizedBox(
        height: kMinInteractiveDimension,
        width: kMinInteractiveDimension,
        child: IconButton(
          onPressed: onTap,
          icon: Icon(
            icon,
            color: colorIcon,
          ),
          splashRadius: kMinInteractiveDimension * 0.5,
        ),
      ),
    );
  }
}
