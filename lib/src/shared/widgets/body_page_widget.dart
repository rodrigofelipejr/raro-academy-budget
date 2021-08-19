import 'package:flutter/material.dart';

import '../utils/utils.dart';

class BodyPageWidget extends StatelessWidget with KeyboardManager {
  final Widget child;
  final EdgeInsetsGeometry contentPadding;

  const BodyPageWidget({
    Key? key,
    required this.child,
    this.contentPadding = const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => hideKeyboard(context),
      child: Padding(
        padding: contentPadding,
        child: child,
      ),
    );
  }
}
