import 'package:flutter/material.dart';

import '../utils/utils.dart';
import 'widgets.dart';

class BodyPageWidget extends StatelessWidget with KeyboardManager {
  final Widget child;
  final EdgeInsetsGeometry contentPadding;
  final bool bodyScrollable;

  const BodyPageWidget({
    Key? key,
    required this.child,
    this.contentPadding = const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0),
    this.bodyScrollable = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => hideKeyboard(context),
      child: Padding(
        padding: contentPadding,
        child: ConditionalParentWidget(
          condition: bodyScrollable,
          conditionalBuilder: (Widget child) {
            return LayoutBuilder(builder: (context, constraint) {
              return SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(minHeight: constraint.maxHeight),
                  child: IntrinsicHeight(
                    child: child,
                  ),
                ),
              );
            });
          },
          child: child,
        ),
      ),
    );
  }
}
