import 'package:animated_card/animated_card.dart';
import 'package:budget/src/shared/constants/constants.dart';
import 'package:flutter/material.dart';

class BodySplashWidget extends StatelessWidget {
  const BodySplashWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final paddingTop = MediaQuery.of(context).size.height * 0.1;

    return AnimatedCard(
      direction: AnimatedCardDirection.top,
      duration: Duration(seconds: 1),
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.only(top: paddingTop),
        child: Stack(
          alignment: AlignmentDirectional.topCenter,
          children: [
            Container(
              padding: EdgeInsets.only(top: paddingTop),
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8.0, 0, 8.0, 23.0),
                    child: Text(
                      'budget',
                      style: AppTextStyles.white72w700Montserrat.copyWith(
                        shadows: AppShadows.shadowsTextLogoBudget,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    child: Text(
                      'YOUR ACADEMY\'S BEST FRIEND',
                      style: AppTextStyles.white13w400Montserrat,
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 0,
              child: Image.asset(
                AppImages.icBudget,
                height: 90,
                width: 90,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
