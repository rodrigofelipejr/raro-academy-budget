import 'package:flutter/material.dart';

import '../../../constants/constants.dart';

class HeaderDrawerWidget extends StatelessWidget {
  final String label;

  const HeaderDrawerWidget({Key? key, required this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Container(
      constraints: BoxConstraints(
        minHeight: 108.0,
      ),
      height: screenSize.height * 0.16,
      decoration: BoxDecoration(
        gradient: AppGradients.blueGradientHeaderDrawer,
      ),
      padding: const EdgeInsets.only(left: 26.0, top: 24.0),
      alignment: Alignment.centerLeft,
      child: Text(
        label,
        style: AppTextStyles.white26w700Roboto.copyWith(
          shadows: AppShadows.shadowsTextAppBar,
        ),
      ),
    );
  }
}
