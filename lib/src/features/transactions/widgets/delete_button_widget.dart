import 'package:flutter/material.dart';

class DeleteButtonWidget extends StatelessWidget {
  const DeleteButtonWidget({
      required this.label,
      required this.onPressed,
  });

  final String? label;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 24,
      alignment: Alignment.center,
      child: ElevatedButton(
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4.0),
              child: Icon(
                Icons.delete,
                size: 22,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4.0),
              child: Text(label ?? ""),
            ),
          ],
        ),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
        ),
        onPressed: onPressed,
      ),
    );
  }
}
