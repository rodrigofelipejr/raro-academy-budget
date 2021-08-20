import 'package:flutter/material.dart';

import 'bar_indicators_widget.dart';
import '../../../../../shared/utils/utils.dart';
import '../../../../../shared/constants/constants.dart';

class IndicatorsWidget extends StatefulWidget {
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
  _IndicatorsWidgetState createState() => _IndicatorsWidgetState();
}

class _IndicatorsWidgetState extends State<IndicatorsWidget> {
  double get percentage => widget.currentValue / widget.referenceValue;
  bool get isPercentageValid => percentage.isFinite;
  MainAxisAlignment get mainAxisAlignment =>
      widget.currentValue != 0 ? MainAxisAlignment.spaceBetween : MainAxisAlignment.center;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width * 0.85;
    final barWidth = (isPercentageValid ? percentage * screenWidth : 0.0);

    return Container(
      width: screenSize.width,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: mainAxisAlignment,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Text(widget.label, style: AppTextStyles.gray14w500Roboto),
              ),
              Text(
                '${Formatters.formatMoney(widget.currentValue)}',
                style: AppTextStyles.gray14w400Roboto,
              ),
            ],
          ),
          Visibility(
            visible: barWidth != 0.0,
            child: Padding(
              padding: const EdgeInsets.only(top: 6.0),
              child: BarIndicatorWidget(
                color: widget.color,
                width: barWidth,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
