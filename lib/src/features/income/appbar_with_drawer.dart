import 'package:flutter/material.dart';
import 'package:flutter_finance_controller/src/features/income/text_styles.dart';

class AppBarWithDrawer extends StatelessWidget with PreferredSizeWidget {
  final Size preferredSize;
  final String title;

  AppBarWithDrawer({
    Key? key,
    required this.title,
  })  : preferredSize = Size.fromHeight(180.0),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final double sizedBoxHeight = MediaQuery.of(context).size.height * 0.06;
    final double containerHeight = MediaQuery.of(context).size.height * 0.32;
    return Container(
        constraints: BoxConstraints(
          minHeight: 120,
          maxHeight: 189,
        ),
        height: containerHeight,
        color: Colors.blue,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: sizedBoxHeight),
            Padding(
              padding: const EdgeInsets.only(
                left: 16,
              ),
              child: IconButton(
                icon: Icon(Icons.menu),
                color: Colors.white,
                iconSize: 25,
                onPressed: () => Scaffold.of(context).openDrawer()
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Text(
                title,
                style: TextStyles.white26w700Roboto,
              ),
            ),
            SizedBox(height: sizedBoxHeight),
          ],
        ),
    );
  }
}
