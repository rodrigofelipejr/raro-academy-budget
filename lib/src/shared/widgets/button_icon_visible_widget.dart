import 'package:flutter/material.dart';

import '../constants/constants.dart';

class ButtonIconVisibleWidget extends StatelessWidget {
  final void Function() onTap;
  final bool showing;

  const ButtonIconVisibleWidget({
    Key? key,
    required this.onTap,
    required this.showing,
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
            color: AppColors.roxo,
          ),
          splashRadius: kMinInteractiveDimension * 0.5,
        ),
      ),
    );
  }
}
