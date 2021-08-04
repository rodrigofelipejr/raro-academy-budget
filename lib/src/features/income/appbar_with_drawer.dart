import 'package:flutter/material.dart';
import 'package:flutter_finance_controller/src/features/income/text_styles.dart';

class AppBarWithDrawer extends StatelessWidget with PreferredSizeWidget {
  final Size preferredSize;

  AppBarWithDrawer({
    Key? key,
  })  : preferredSize = Size.fromHeight(189),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 189,
      color: Colors.blue,
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 49,
              bottom: 115,
              left: 16,
              right: 319,
            ),
            child: IconButton(
              icon: Icon(Icons.menu),
              color: Colors.white,
              iconSize: 25,
              onPressed: () {},
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 95,
              bottom: 62,
            ),
            child: Align(
              alignment: Alignment.center,
              child: Text(
                "Entrada",
                style: TextStyles.white26w700Roboto,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
