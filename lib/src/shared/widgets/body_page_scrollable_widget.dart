import 'package:flutter/material.dart';

import '../utils/utils.dart';

class BodyPageScrollableWidget extends StatelessWidget with KeyboardManager {
  final Widget child;
  final EdgeInsetsGeometry contentPadding;

  const BodyPageScrollableWidget({
    Key? key,
    required this.child,
    this.contentPadding = const EdgeInsets.only(),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraint) {
      return SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(minHeight: constraint.maxHeight),
          child: IntrinsicHeight(
            child: Padding(
              padding: contentPadding,
              child: child,
            ),
          ),
        ),
      );
    });
  }
}
