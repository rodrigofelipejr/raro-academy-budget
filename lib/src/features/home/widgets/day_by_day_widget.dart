import 'package:flutter/material.dart';
import 'package:flutter_finance_controller/src/features/home/widgets/month_selector_widget.dart';

import 'card_widget.dart';
import 'indicators_widget.dart';
import '../../../shared/constants/constants.dart';

class DayByDayWidget extends StatefulWidget {
  const DayByDayWidget({Key? key}) : super(key: key);

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
                MonthSelectorWidget(label: 'AGO')
              ],
            ),
            SizedBox(
              height: 6.0,
            ),
            Text(
              'R\$ 3.000,00',
              style: AppTextStyles.black24w400Roboto,
            ),
            SizedBox(
              height: 16.0,
            ),
            IndicatorsWidget(
              label: 'Saídas',
              currentValue: 5000,
              referenceValue: 8000,
              color: AppColors.ciano,
            ),
            SizedBox(
              height: 16.0,
            ),
            IndicatorsWidget(
              label: 'Saídas',
              currentValue: 8000,
              referenceValue: 8000,
              color: AppColors.amarelo,
            ),
          ],
        ),
      ),
    );
  }
}
