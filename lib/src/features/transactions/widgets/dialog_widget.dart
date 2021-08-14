import 'package:budget/src/shared/constants/constants.dart';
import 'package:flutter/material.dart';

class DialogWidget extends StatelessWidget {
  const DialogWidget({
    this.message,
  });

  final String? message;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      alignment: Alignment.center,
      child: Card(
        borderOnForeground: false,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(7.0),
          ),
        ),
        elevation: 3,
        child: Container(
          decoration: BoxDecoration(
            gradient: AppGradients.blueGradientAppBar,
            borderRadius: BorderRadius.all(
              Radius.circular(7.0),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 24.0,
              vertical: 38.0,
            ),
            child: Text(
              message ?? "",
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w500,
                letterSpacing: 0.25,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
