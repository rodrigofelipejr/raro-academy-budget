import 'package:flutter/material.dart';
import 'package:flutter_finance_controller/src/shared/constants/constants.dart';

class CardWidget extends StatelessWidget {
  final Widget child;

  const CardWidget({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: AppShadows.shadowsCard,
        color: AppColors.white,
        borderRadius: BorderRadius.all(Radius.circular(7.0)),
      ),
      padding: const EdgeInsets.all(16.0),
      child: child,
    );
  }
}
