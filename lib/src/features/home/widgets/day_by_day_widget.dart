import 'package:flutter/material.dart';

import 'card_widget.dart';
import 'indicators_widget.dart';
import 'month_selector_widget.dart';
import '../../../shared/utils/utils.dart';
import '../../../shared/constants/constants.dart';

class DayByDayWidget extends StatefulWidget {
  final double balance;
  final double inputs;
  final double outputs;
  final String month;

  const DayByDayWidget({
    Key? key,
    required this.balance,
    required this.inputs,
    required this.outputs,
    required this.month,
  }) : super(key: key);

  @override
  _DayByDayStateWidget createState() => _DayByDayStateWidget();
}

class _DayByDayStateWidget extends State<DayByDayWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16.0),
      child: CardWidget(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Dia a dia',
                  style: AppTextStyles.purple20w500Roboto,
                ),
                MonthSelectorWidget(label: widget.month)
              ],
            ),
            SizedBox(
              height: 6.0,
            ),
            Text(
              'R\$ ${Formatters.formatMoney(widget.balance)}',
              style: AppTextStyles.black24w400Roboto,
            ),
            SizedBox(
              height: 16.0,
            ),
            IndicatorsWidget(
              label: 'Saídas',
              currentValue: widget.outputs,
              referenceValue: widget.inputs,
              color: AppColors.ciano,
            ),
            SizedBox(
              height: 16.0,
            ),
            IndicatorsWidget(
              label: 'Entradas',
              currentValue: widget.inputs,
              referenceValue: widget.inputs,
              color: AppColors.amarelo,
            ),
          ],
        ),
      ),
    );
  }
}
