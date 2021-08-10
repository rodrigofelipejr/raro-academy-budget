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

  MainAxisAlignment get mainAxisAlignment =>
      currentValue != 0 ? MainAxisAlignment.spaceBetween : MainAxisAlignment.start;

  @override
  Widget build(BuildContext context) {
    final _screenWidth = MediaQuery.of(context).size.width * 0.85;
    final percentage = (currentValue / referenceValue);
    final _width = percentage.isFinite ? percentage * _screenWidth : 0.0;

    return Container(
      width: double.infinity,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: mainAxisAlignment,
            children: [
              ConstrainedBox(
                constraints: BoxConstraints(
                  minWidth: _screenWidth * 0.3,
                ),
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
          _width != 0
              ? Padding(
                  padding: const EdgeInsets.only(top: 6.0),
                  child: BarIndicatorWidget(
                    color: color,
                    width: _width,
                  ),
                )
              : SizedBox(),
        ],
      ),
    );
  }
}
