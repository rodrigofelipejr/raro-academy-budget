import 'package:animated_card/animated_card.dart';
import 'package:flutter/material.dart';

import '../../../shared/constants/constants.dart';

class FooterSplashWidget extends StatelessWidget {
  const FooterSplashWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final paddingBottom = MediaQuery.of(context).size.height * 0.0625;

    return AnimatedCard(
      direction: AnimatedCardDirection.bottom,
      duration: Duration(seconds: 1),
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.only(bottom: paddingBottom),
        child: Column(
          children: [
            Text(
              'powered by',
              style: AppTextStyles.whiteOpacity13w300Roboto,
            ),
            SizedBox(height: 10.0),
            Image.asset(
              AppImages.logoRaroAcademy,
              height: 100,
              width: 100,
            ),
          ],
        ),
      ),
    );
  }
}
