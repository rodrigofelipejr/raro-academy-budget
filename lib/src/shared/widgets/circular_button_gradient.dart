import 'package:budget/src/features/login/page/login/login_controller.dart';
import 'package:budget/src/shared/constants/app_gradients.dart';
import 'package:budget/src/shared/constants/constants.dart';
import 'package:flutter/material.dart';

class CircularButtonGradient extends StatelessWidget {
  const CircularButtonGradient({
    Key? key,
    required this.text,
    this.disabled = false,
    this.onTap,
  }) : super(key: key);

  final String text;
  final bool disabled;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return disabled
        ? Container(
            decoration: BoxDecoration(
              color: AppColors.lightGray,
              borderRadius: BorderRadius.circular(34.0),
            ),
            child: Material(
              borderRadius: BorderRadius.circular(34.0),
              color: AppColors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(34.0),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
                  child: Text(
                    text,
                    style: AppTextStyles.darkGray14w500Roboto,
                  ),
                ),
              ),
            ),
          )
        : Container(
            decoration: BoxDecoration(
              gradient: AppGradients.blueGradientButtons,
              borderRadius: BorderRadius.circular(34.0),
              boxShadow: AppShadows.shadowsButtons,
            ),
            child: Material(
              borderRadius: BorderRadius.circular(34.0),
              color: AppColors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(34.0),
                onTap: onTap,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
                  child: Text(
                    text,
                    style: AppTextStyles.white14w500Roboto,
                  ),
                ),
              ),
            ),
          );
  }
}
