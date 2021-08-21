import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../../shared/constants/constants.dart';
import '../../../../../shared/utils/utils.dart';
import '../stores/transactions_store.dart';

class ButtonsTabBarWidget extends StatelessWidget {
  final VoidCallback? buttonInput;
  final VoidCallback? buttonOutput;
  final VoidCallback? buttonAll;

  const ButtonsTabBarWidget({
    Key? key,
    this.buttonInput,
    this.buttonOutput,
    this.buttonAll,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(gradient: AppGradients.blueGradientAppBar),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Observer(builder: (_) {
            final totalValue = Modular.get<TransactionsStore>().transactionTotal;
            final bool positiveValue = totalValue >= 0.0;
            return Text(
              '${positiveValue ? "" : "-"}${Formatters.formatMoney(totalValue.abs())}',
              style: AppTextStyles.white26w700Roboto,
            );
          }),
          SizedBox(height: 11),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildTextButtonWidget("Entradas", buttonInput, 0),
                Container(
                  height: 20,
                  width: 1,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.white,
                      width: 1,
                    ),
                  ),
                ),
                _buildTextButtonWidget("Saídas", buttonOutput, 1),
                Container(
                  height: 20,
                  width: 1,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.white,
                      width: 1,
                    ),
                  ),
                ),
                _buildTextButtonWidget("Todos", buttonAll, 2),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildTextButtonWidget(String text, VoidCallback? onPressed, int screen) {
    return Observer(
      builder: (_) {
        return Expanded(
          child: TextButton(
            onPressed: Modular.get<TransactionsStore>().onError != null ? null : onPressed,
            child: Text(
              text,
              style: TextStyle(
                  fontSize: 16,
                  color: Modular.get<TransactionsStore>().onError != null
                      ? Color.fromARGB(60, 255, 255, 255)
                      : Modular.get<TransactionsStore>().indexPage == screen
                          ? Colors.white
                          : Color.fromARGB(60, 255, 255, 255)),
            ),
          ),
        );
      },
    );
  }
}
