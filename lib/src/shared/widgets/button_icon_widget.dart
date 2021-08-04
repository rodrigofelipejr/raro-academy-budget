import 'package:flutter/material.dart';
import 'package:budget/src/shared/constants/app_colors.dart';

class ButtonIconWidget extends StatelessWidget {
  final void Function() onTap;
  final Widget child;

  const ButtonIconWidget({
    Key? key,
    required this.onTap,
    required this.child,
  }) : super(key: key);

  BorderRadius? get borderRadius => BorderRadius.circular(kMinInteractiveDimension);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.transparent,
      borderRadius: borderRadius,
      child: SizedBox(
        height: kMinInteractiveDimension,
        width: kMinInteractiveDimension,
        child: InkWell(
          borderRadius: borderRadius,
          onTap: onTap,
          child: child,
        ),
      ),
    );
  }
}
