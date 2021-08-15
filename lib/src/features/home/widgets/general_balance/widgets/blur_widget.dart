import 'dart:ui';

import 'package:flutter/material.dart';

class BlurWidget extends StatelessWidget {
  final Widget child;
  final double blur;
  final bool blurEnable;
  final Color blurColor;
  final BorderRadius? borderRadius;
  final double colorOpacity;
  final Widget? overlay;
  final AlignmentGeometry alignment;

  const BlurWidget({
    Key? key,
    required this.blurEnable,
    required this.child,
    this.blur = 10.0,
    this.blurColor = Colors.white,
    this.borderRadius,
    this.colorOpacity = 0.5,
    this.overlay,
    this.alignment = Alignment.center,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (!blurEnable) {
      return child;
    }

    return ClipRRect(
      borderRadius: borderRadius ?? BorderRadius.zero,
      child: Stack(
        children: [
          child,
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: blur, sigmaY: blur),
              child: Container(
                decoration: BoxDecoration(
                  color: blurColor.withOpacity(colorOpacity),
                ),
                alignment: alignment,
                child: overlay,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
