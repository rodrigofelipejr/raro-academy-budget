import 'package:flutter/material.dart';

class VisibleWidget extends StatelessWidget {
  const VisibleWidget({
    Key? key,
    required this.visible,
    required this.onPressed,
  }) : super(key: key);

  final bool visible;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        visible ? Icons.visibility_outlined : Icons.visibility_off_outlined,
        color: Colors.grey,
      ),
      onPressed: onPressed,
    );
  }
}
