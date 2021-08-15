import 'package:budget/src/features/daily/daily_store.dart';
import 'package:budget/src/shared/utils/formatters.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../../../shared/constants/constants.dart';

class ButtonsAppBarDay extends StatelessWidget {
  final VoidCallback? buttonin;
  final VoidCallback? buttonout;
  final VoidCallback? buttonall;
  const ButtonsAppBarDay(
      {Key? key, this.buttonin, this.buttonout, this.buttonall})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(gradient: AppGradients.blueGradientAppBar),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Observer(builder: (_) {
            return Text(
              '${Formatters.formatMoney(Modular.get<DailyStore>().transactionTotal)}',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 26,
                  fontWeight: FontWeight.w700),
            );
          }),
          SizedBox(height: 11),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                textbutton("Entradas", buttonin, 0),
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
                textbutton("Saídas", buttonout, 1),
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
                textbutton("Todos", buttonall, 2),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget textbutton(String text, VoidCallback? button, int screen) {
    return Observer(builder: (_) {
      return Expanded(
        child: TextButton(
          onPressed: button,
          child: Text(
            text,
            style: TextStyle(
                fontSize: 16,
                color: Modular.get<DailyStore>().indexPage == screen
                    ? Colors.white
                    : Color.fromARGB(60, 255, 255, 255)),
          ),
        ),
      );
    });
  }
}
