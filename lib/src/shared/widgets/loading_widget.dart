import 'package:flutter/material.dart';

import '../constants/constants.dart';
import 'widgets.dart';

class LoadingWidget extends StatelessWidget {
  final bool fullScreen;
  const LoadingWidget({Key? key, this.fullScreen = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConditionalParentWidget(
      condition: fullScreen,
      child: ProgressIndicatorWidget(
        label: 'Carregando...',
      ),
      conditionalBuilder: (Widget child) => Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: AppGradients.purpleGradientScaffold,
          ),
          child: child,
        ),
      ),
    );
  }
}
