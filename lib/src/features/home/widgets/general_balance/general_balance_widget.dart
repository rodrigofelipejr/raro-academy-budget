import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../shared/constants/constants.dart';
import '../../../../shared/utils/utils.dart';
import '../../../../shared/widgets/widgets.dart';

import 'general_balance_store.dart';
import '../../../../shared/widgets/button_icon_visible_widget.dart';
import 'widgets/blur_widget.dart';

class GeneralBalanceWidget extends StatefulWidget {
  const GeneralBalanceWidget({Key? key}) : super(key: key);

  @override
  GeneralBalanceStateWidget createState() => GeneralBalanceStateWidget();
}

class GeneralBalanceStateWidget extends ModularState<GeneralBalanceWidget, GeneralBalanceStore> {
  Widget _buildText(String label) => Text(label, style: AppTextStyles.black24w400Roboto);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Container(
      margin: const EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
      child: CardWidget(
        child: Observer(
          builder: (_) => WrapperWidget(
            visible: store.onError != null,
            overlay: TryAgainButtonWidget(
              onPressed: () => store.handleGeneralBalance(),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Saldo geral',
                      style: AppTextStyles.purple20w500Roboto,
                    ),
                    ButtonIconVisibleWidget(
                      showing: store.visibleBalance,
                      onTap: () => store.setVisibleBalance(!store.visibleBalance),
                    ),
                  ],
                ),
                BlurWidget(
                  blurEnable: !store.visibleBalance,
                  child: SizedBox(
                    width: screenSize.width,
                    child: _buildText('R\$ ${Formatters.formatMoney(store.state.value)}'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
