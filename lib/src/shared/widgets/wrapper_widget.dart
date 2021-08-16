import 'package:flutter/material.dart';

class WrapperWidget extends StatelessWidget {
  final Widget child;
  final Widget overlay;
  final bool visible;
  final BorderRadius? borderRadius;

  const WrapperWidget({
    Key? key,
    required this.child,
    required this.overlay,
    required this.visible,
    this.borderRadius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return visible
        ? ClipRRect(
            borderRadius: borderRadius ?? BorderRadius.zero,
            child: Stack(
              children: [
                child,
                Positioned.fill(
                  child: overlay,
                ),
              ],
            ),
          )
        : child;
  }
}
