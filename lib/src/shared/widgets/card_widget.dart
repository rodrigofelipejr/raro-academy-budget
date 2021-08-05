import 'package:flutter/material.dart';

import '../constants/constants.dart';

class CardWidget extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry contentPadding;

  const CardWidget({
    Key? key,
    required this.child,
    this.contentPadding = const EdgeInsets.all(16.0),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: AppShadows.shadowsCard,
        color: AppColors.white,
        borderRadius: BorderRadius.all(Radius.circular(7.0)),
      ),
      padding: contentPadding,
      child: Material(
        color: AppColors.transparent,
        child: child,
      ),
    );
  }
}
