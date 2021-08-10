import 'package:flutter/material.dart';

import '../constants/constants.dart';

class ProgressIndicatorWidget extends StatelessWidget {
  const ProgressIndicatorWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator(
            backgroundColor: AppColors.roxo,
            color: AppColors.ciano,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 14.0),
            child: Text('Carregando...'),
          )
        ],
      ),
    );
  }
}
