import 'package:flutter/material.dart';
import 'package:flutter_finance_controller/src/features/income/text_styles.dart';

class ButtonWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 123,
      height: 50,
      decoration: BoxDecoration(
        color: Colors.blue,
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
