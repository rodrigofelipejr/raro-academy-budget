import 'package:budget/src/shared/constants/app_gradients.dart';
import 'package:flutter/material.dart';
import 'text_styles.dart';

class ButtonWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 123,
      height: 50,
      decoration: BoxDecoration(
        gradient: AppGradients.blueGradientAppBar,
        // color: Colors.blue,
        borderRadius: BorderRadius.all(
          Radius.circular(24.0),
        ),
      ),
      child: IconButton(
        onPressed: () {},
        icon: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Icon(
              Icons.add,
              color: Colors.white,
              semanticLabel: "INSERIR",
            ),
            Text(
              "INSERIR",
              style: TextStyles.white15w500Roboto,
            ),
          ],
        ),
      ),
    );
  }
}
