import 'package:flutter/material.dart';

class DialogWidget extends StatelessWidget {
  const DialogWidget({
    this.height,
    this.fontSize,
    required this.message,
  });

  final double? height;
  final double? fontSize;
  final String message;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      alignment: Alignment.center,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16.0,
            vertical: 32.0,
          ),
          child: Text(
            message,
            style: TextStyle(
              fontSize: fontSize,
            ),
          ),
        ),
      ),
    );
  }
}
