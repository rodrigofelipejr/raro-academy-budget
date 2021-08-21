import 'package:flutter/material.dart';

import '../constants/constants.dart';

class ButtonCircularGradientWidget extends StatelessWidget {
  final String label;
  final Function()? onTap;

  const ButtonCircularGradientWidget({
    Key? key,
    required this.label,
    this.onTap,
  }) : super(key: key);

  double get defaultRadius => 34.0;
  Color? get color => onTap == null ? AppColors.lightGray : null;
  Gradient? get gradient => onTap != null ? AppGradients.blueGradientButtons : null;
  TextStyle get style => onTap != null ? AppTextStyles.white14w500Roboto : AppTextStyles.darkGray14w500Roboto;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        gradient: gradient,
        borderRadius: BorderRadius.circular(defaultRadius),
        boxShadow: AppShadows.shadowsButtons,
      ),
      child: Material(
        borderRadius: BorderRadius.circular(defaultRadius),
        color: AppColors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(defaultRadius),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 12.0,
            ),
            child: Text(
              label,
              style: style,
            ),
          ),
        ),
      ),
    );
  }
}
