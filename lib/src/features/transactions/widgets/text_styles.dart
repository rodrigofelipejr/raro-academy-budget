import 'package:flutter/material.dart';

import '/src/shared/constants/app_colors.dart';

class TextStyles {
  static const TextStyle white26w700Roboto = TextStyle(
    color: Colors.white,
    fontSize: 26,
    fontFamily: 'Roboto',
    fontWeight: FontWeight.w700,
    letterSpacing: 0.25,
  );

  static const TextStyle blue14w500Roboto = TextStyle(
    fontFamily: "Roboto",
    fontWeight: FontWeight.w500,
    fontSize: 14.0,
    letterSpacing: 0.4,
    color: AppColors.azul,
  );

  static const TextStyle white15w500Roboto = TextStyle(
    fontFamily: "Roboto",
    fontSize: 15,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.46,
    color: Colors.white,
  );

  static final TextStyle blue12w400RobotoOp54 = TextStyle(
    color: AppColors.azul.withOpacity(0.54),
    fontFamily: 'Roboto',
    fontSize: 12,
    fontWeight: FontWeight.normal,
    letterSpacing: 0.15,
  );

  static final TextStyle blue16w400RobotoOp54 = TextStyle(
    fontFamily: 'Roboto',
    color: AppColors.azul.withOpacity(0.54),
    fontSize: 16,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.15,
  );

  static final TextStyle black12w400RobotoOp54 = TextStyle(
    color: Colors.black.withOpacity(0.54),
    fontFamily: 'Roboto',
    fontSize: 12,
    fontWeight: FontWeight.normal,
    letterSpacing: 0.15,
  );

  static final TextStyle black16w400RobotoOp54 = TextStyle(
    fontFamily: 'Roboto',
    color: Colors.black.withOpacity(0.54),
    fontSize: 16,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.15,
  );

  static final TextStyle blue16w400RobotoOp87 = TextStyle(
    fontFamily: 'Roboto',
    color: AppColors.azul.withOpacity(0.87),
    fontSize: 16,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.15,
  );

  static final TextStyle black16w400RobotoOp87 = TextStyle(
    fontFamily: 'Roboto',
    color: Colors.black.withOpacity(0.87),
    fontSize: 16,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.15,
  );
}
