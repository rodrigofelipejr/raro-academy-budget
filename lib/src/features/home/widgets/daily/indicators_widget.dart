import 'package:flutter/material.dart';

import 'bar_indicators_widget.dart';
import '../../../../shared/utils/utils.dart';
import '../../../../shared/constants/constants.dart';

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
    final _screenWidth = MediaQuery.of(context).size.width * 0.85;
    final _width = (currentValue / referenceValue) * _screenWidth;

    return Container(
      // color: Colors.green,
      width: double.infinity,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 24.0),
                child: Text(
                  label,
                  style: AppTextStyles.gray14w500Roboto,
                ),
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
          BarIndicatorWidget(
            color: color,
            width: _width,
          ),
        ],
      ),
    );
  }
}
