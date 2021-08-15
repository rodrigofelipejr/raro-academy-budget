import 'package:flutter/material.dart';

class AnimatedSwitcherWidget extends StatelessWidget {
  final Widget child;

  const AnimatedSwitcherWidget({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 400),
      child: child,
    );
  }
}
