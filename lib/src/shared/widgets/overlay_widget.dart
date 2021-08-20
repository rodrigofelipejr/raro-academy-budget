import 'dart:ui';

import 'package:flutter/material.dart';

import '../constants/constants.dart';
import 'widgets.dart';

const defaultValue = 56.0;

class OverlayWidget extends StatelessWidget {
  final Widget? _progressIndicator;
  final String? _label;

  OverlayWidget._(this._progressIndicator, this._label);

  static OverlayEntry? _currentOverlay;
  static OverlayState? _overlayState;

  static void show(
    BuildContext context, {
    Widget? child,
    String? label,
    bool safeArea = true,
  }) {
    _overlayState = Overlay.of(context);

    if (_currentOverlay == null) {
      _currentOverlay = OverlayEntry(
        builder: (context) => _buildLoader(
          safeArea: safeArea,
          child: child,
          label: label,
        ),
      );
      try {
        WidgetsBinding.instance?.addPostFrameCallback(
          (_) => _overlayState?.insertAll(
            [_currentOverlay!],
          ),
        );
      } catch (e) {}
    }
  }

  static void hide() {
    if (_currentOverlay != null) {
      try {
        _currentOverlay?.remove();
      } catch (e) {
        print(e.toString());
      } finally {
        _currentOverlay = null;
      }
    }
  }

  static Widget _buildLoader({required bool safeArea, Widget? child, String? label}) {
    return TweenAnimationBuilder(
      tween: Tween<double>(begin: 0, end: 1),
      duration: const Duration(milliseconds: 400),
      builder: (context, _, __) {
        return Stack(
          clipBehavior: Clip.antiAlias,
          alignment: Alignment.center,
          children: [
            Opacity(
              opacity: 0.9,
              child: Container(
                decoration: BoxDecoration(
                  gradient: AppGradients.purpleGradientScaffold,
                ),
              ),
            ),
            ConditionalParentWidget(
              condition: safeArea,
              conditionalBuilder: (Widget child) => SafeArea(child: child),
              child: Center(
                child: OverlayWidget._(child, label),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.transparent,
      child: Center(
        child: _progressIndicator ??
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ProgressIndicatorWidget(
                  label: _label,
                ),
              ],
            ),
      ),
    );
  }
}
