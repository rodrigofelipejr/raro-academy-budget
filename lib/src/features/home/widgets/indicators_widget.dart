import 'package:flutter/material.dart';

import '../../../shared/utils/utils.dart';
import '../../../shared/constants/app_text_styles.dart';

class IndicatorsWidget extends StatelessWidget {
  final String label;
  final double currentValue;
  final double referenceValue;
  final Color color;

  const IndicatorsWidget({
    Key? key,
    required this.label,
    required this.currentValue,
    required this.referenceValue,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width * 0.85;
    final indicatorWidth = (currentValue / referenceValue) * screenWidth;

    return Container(
      width: indicatorWidth,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                label,
                style: AppTextStyles.gray14w500Roboto,
              ),
              Text(
                'R\$ ${Formatters.formatMoney(currentValue)}',
                style: AppTextStyles.gray14w400Roboto,
              ),
            ],
          ),
          SizedBox(
            height: 6.0,
          ),
          Container(
            width: indicatorWidth,
            height: 12.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(360.0),
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}
