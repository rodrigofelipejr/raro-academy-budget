import 'package:flutter/material.dart';

import '../constants/constants.dart';

class ProgressIndicatorWidget extends StatelessWidget {
  final double height;
  final String? label;

  const ProgressIndicatorWidget({
    Key? key,
    this.label,
    this.height = 36.0,
  }) : super(key: key);

  final double size = 36.0;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: height,
            width: height,
            child: CircularProgressIndicator(
              backgroundColor: AppColors.roxo,
              valueColor: AlwaysStoppedAnimation(AppColors.ciano),
            ),
          ),
          if (label != null && label?.isNotEmpty == true)
            Padding(
              padding: const EdgeInsets.only(top: 14.0),
              child: Text(label!),
            )
        ],
      ),
    );
  }
}
