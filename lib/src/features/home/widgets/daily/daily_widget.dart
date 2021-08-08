import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'indicators_widget.dart';
import 'month_selector_widget.dart';
import '../../home_store.dart';
import '../../../../shared/constants/constants.dart';
import '../../../../shared/utils/utils.dart';
import '../../../../shared/widgets/widgets.dart';

class DailyWidget extends StatefulWidget {
  final double balance;
  final double inputs;
  final double outputs;
  final String month;

  const DailyWidget({
    Key? key,
    required this.balance,
    required this.inputs,
    required this.outputs,
    required this.month,
  }) : super(key: key);

  @override
  _DailyStateWidget createState() => _DailyStateWidget();
}

class _DailyStateWidget extends State<DailyWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16.0),
      child: CardWidget(
        contentPadding: const EdgeInsets.all(0.0),
        child: InkWell(
          onTap: () => Modular.to.pushNamed(AppRoutes.daily),
          borderRadius: BorderRadius.all(Radius.circular(7.0)),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
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
                    MonthSelectorWidget(
                      label: widget.month,
                      referenceDate: Modular.get<HomeStore>().state.selectedDate,
                      changeSelectedDate: Modular.get<HomeStore>().handleChangeMonthSelected,
                    )
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
                  referenceValue: max(widget.inputs, widget.outputs),
                  color: AppColors.ciano,
                ),
                SizedBox(
                  height: 16.0,
                ),
                IndicatorsWidget(
                  label: 'Entradas',
                  currentValue: widget.inputs,
                  referenceValue: max(widget.inputs, widget.outputs),
                  color: AppColors.amarelo,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
