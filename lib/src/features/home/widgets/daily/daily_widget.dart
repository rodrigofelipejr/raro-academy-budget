import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../shared/constants/constants.dart';
import '../../../../shared/utils/utils.dart';
import '../../../../shared/widgets/widgets.dart';

import '../../home.dart';
import 'daily_store.dart';
import 'widgets/indicators_widget.dart';

class DailyWidget extends StatefulWidget {
  const DailyWidget({Key? key}) : super(key: key);

  @override
  _DailyStateWidget createState() => _DailyStateWidget();
}

class _DailyStateWidget extends ModularState<DailyWidget, DailyStore> {
  bool get resetValues => store.state.inputs == 0.0 && store.state.outputs == 0.0;

  Widget _buildInput() {
    return IndicatorsWidget(
      label: 'Entradas',
      currentValue: store.state.inputs,
      referenceValue: max(store.state.inputs, store.state.outputs),
      color: AppColors.amarelo,
    );
  }

  Widget _buildOutput() {
    return IndicatorsWidget(
      label: 'Saídas',
      currentValue: store.state.outputs,
      referenceValue: max(store.state.inputs, store.state.outputs),
      color: AppColors.ciano,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16.0),
      child: CardWidget(
        contentPadding: const EdgeInsets.all(0.0),
        child: InkWell(
          onTap: () => Modular.to.pushNamed(AppRoutes.transaction),
          borderRadius: BorderRadius.all(Radius.circular(7.0)),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Observer(
              builder: (_) {
                return WrapperWidget(
                  visible: store.onError != null,
                  overlay: TryAgainButtonWidget(
                    onPressed: () => store.handleDaily(),
                  ),
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
                            label: store.selectedMonthDescription,
                            referenceDate: Modular.get<HomeStore>().dailyStore.state.date,
                            changeSelectedDate: (DateTime date) =>
                                Modular.get<HomeStore>().dailyStore.handleDaily(date: date),
                          )
                        ],
                      ),
                      SizedBox(height: 6.0),
                      Text(
                        '${Formatters.formatMoney(store.state.dailyBalance)}',
                        style: AppTextStyles.black24w400Roboto,
                      ),
                      SizedBox(height: 12.0),
                      (resetValues)
                          ? Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Flexible(child: _buildInput()),
                                Flexible(child: _buildOutput()),
                              ],
                            )
                          : Column(
                              children: [
                                _buildInput(),
                                SizedBox(height: 6.0),
                                _buildOutput(),
                              ],
                            ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
