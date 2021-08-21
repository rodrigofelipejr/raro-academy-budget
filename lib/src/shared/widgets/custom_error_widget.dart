import 'package:budget/src/shared/constants/app_strings.dart';
import 'package:budget/src/shared/constants/app_text_styles.dart';
import 'package:budget/src/shared/utils/utils.dart';
import 'package:budget/src/shared/widgets/widgets.dart';
import 'package:flutter/material.dart';

class CustomErrorWidget extends StatelessWidget {
  final String? label;
  final String message;
  final void Function() onTap;

  const CustomErrorWidget({
    Key? key,
    required this.message,
    required this.onTap,
    this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: screenWidth(context),
      padding: EdgeInsets.symmetric(horizontal: screenWidthPercentage(context) * 0.05),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            message,
            style: AppTextStyles.ciano28w400Roboto,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 16.0),
          ButtonCircularGradientWidget(
            label: (label ?? AppStrings.txtTentarNovamente).toUpperCase(),
            onTap: onTap,
          )
        ],
      ),
    );
  }
}
