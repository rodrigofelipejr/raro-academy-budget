import 'dart:math';

import 'package:flutter/widgets.dart';

import 'app_colors.dart';

class AppGradients {
  static const blueGradient = LinearGradient(
    colors: <Color>[
      AppColors.ciano,
      AppColors.roxo,
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    stops: [
      0.1,
      0.7,
    ],
    transform: GradientRotation((-34 * pi) / 180),
  );

  static const blueGradientAppBar = LinearGradient(
    colors: <Color>[
      AppColors.ciano,
      AppColors.roxo,
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    stops: [
      0.1,
      0.65,
    ],
    transform: GradientRotation((60 * pi) / 180),
  );
}
