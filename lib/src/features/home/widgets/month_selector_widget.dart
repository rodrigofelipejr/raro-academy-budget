import 'package:flutter/material.dart';

import '../../../shared/constants/constants.dart';

class MonthSelectorWidget extends StatelessWidget {
  final String label;

  const MonthSelectorWidget({Key? key, required this.label}) : super(key: key);

  BorderRadius get borderRadius => BorderRadius.circular(34.0);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: AppGradients.blueGradientButtons,
        borderRadius: borderRadius,
        boxShadow: AppShadows.shadowsButtons,
      ),
      child: Material(
        borderRadius: borderRadius,
        color: AppColors.transparent,
        child: InkWell(
          borderRadius: borderRadius,
          onTap: () {},
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
