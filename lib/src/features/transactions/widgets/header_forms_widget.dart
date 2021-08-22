import 'package:flutter/material.dart';

import '../../../shared/constants/constants.dart';
import '../../../shared/utils/utils.dart';

class HeaderFormsWidget extends StatelessWidget {
  final String title;

  const HeaderFormsWidget({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        minHeight: screenHeightPercentage(context) * 0.25,
        maxHeight: 180,
      ),
      height: screenHeight(context),
      decoration: BoxDecoration(
        gradient: AppGradients.blueGradientAppBar,
        boxShadow: AppShadows.shadowsAppBar,
      ),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: AppTextStyles.white26w700Roboto,
            ),
          ],
        ),
      ),
    );
  }
}
