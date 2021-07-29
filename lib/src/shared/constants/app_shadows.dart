import 'package:flutter/material.dart';

import 'constants.dart';

class AppShadows {
  static List<BoxShadow> get shadowsTextAppBar => [
        BoxShadow(
          color: AppColors.black.withOpacity(0.12),
          offset: Offset(0.0, 6.0),
          blurRadius: 32.0,
          spreadRadius: 5.0,
        ),
        BoxShadow(
          color: AppColors.black.withOpacity(0.14),
          offset: Offset(0.0, 17.0),
          blurRadius: 26.0,
          spreadRadius: 2.0,
        ),
        BoxShadow(
          color: AppColors.black.withOpacity(0.20),
          offset: Offset(0.0, 8.0),
          blurRadius: 11.0,
          spreadRadius: -5.0,
        ),
      ];

  static List<BoxShadow> get shadowsAppBar => [
        BoxShadow(
          color: AppColors.black.withOpacity(0.25),
          offset: Offset(0.0, 4.0),
          blurRadius: 28.0,
        ),
      ];
}
