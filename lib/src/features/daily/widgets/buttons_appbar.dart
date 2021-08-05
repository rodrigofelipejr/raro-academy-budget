import 'package:flutter/material.dart';
import '../../../shared/constants/constants.dart';

class ButtonsAppBarDay extends StatelessWidget {
  final int? tela;
  final VoidCallback? buttonin;
  final VoidCallback? buttonout;
  final VoidCallback? buttonall;
  const ButtonsAppBarDay(
      {Key? key, this.tela, this.buttonin, this.buttonout, this.buttonall})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(gradient: AppGradients.blueGradientAppBar),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            'R\$ 1.104,53',
            style: TextStyle(
                color: Colors.white, fontSize: 26, fontWeight: FontWeight.w700),
          ),
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

  Expanded textbutton(String text, VoidCallback? button, int screen) {
    return Expanded(
      child: TextButton(
        onPressed: button,
        child: Text(
          text,
          style: TextStyle(
              fontSize: 16,
              color: tela == screen
                  ? Colors.white
                  : Color.fromARGB(60, 255, 255, 255)),
        ),
      ),
    );
  }
}
