import 'package:flutter/material.dart';

import '../utils/utils.dart';

class SpaceBottomWidget extends StatelessWidget {
  final double height;

  const SpaceBottomWidget({Key? key, this.height = 0.05}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: screenHeight(context) * height,
    );
  }
}
