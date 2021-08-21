import 'package:flutter/material.dart';

import '../constants/constants.dart';

class CircularButtonGradientWithColor extends StatelessWidget {
  final String text;
  final Color color;
  final Function()? onTap;

  const CircularButtonGradientWithColor({
    Key? key,
    required this.text,
    required this.color,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: AppGradients.blueGradientButtons,
        borderRadius: BorderRadius.circular(34.0),
        boxShadow: AppShadows.shadowsButtons,
      ),
      child: Material(
        borderRadius: BorderRadius.circular(34.0),
        color: color,
        child: InkWell(
          borderRadius: BorderRadius.circular(34.0),
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
            child: Text(
              text,
              style: AppTextStyles.white14w500Roboto,
            ),
          ),
        ),
      ),
    );
  }
}
