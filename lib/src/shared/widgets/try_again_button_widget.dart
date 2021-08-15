import 'package:flutter/material.dart';

import '../constants/constants.dart';

class TryAgainButtonWidget extends StatelessWidget {
  final String label;
  final bool fill;
  final void Function()? onPressed;

  const TryAgainButtonWidget({
    Key? key,
    this.label = 'Tentar novamente',
    this.fill = true,
    this.onPressed,
  }) : super(key: key);

  Widget _buildTextButton() {
    return TextButton(
      onPressed: onPressed,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.restart_alt,
              color: AppColors.roxo,
            ),
            SizedBox(width: 4.0),
            Text(
              label,
              style: TextStyle(
                color: AppColors.roxo,
                // shadows: [Shadow(color: AppColors.roxo, offset: Offset(0, -3))],
                // color: Colors.transparent,
                // decoration: TextDecoration.underline,
                // decorationColor: AppColors.roxo.withOpacity(0.5),
                // decorationThickness: 2,
                // decorationStyle: TextDecorationStyle.solid,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (!fill) return _buildTextButton();

    return Container(
      color: AppColors.white,
      child: Center(
        child: _buildTextButton(),
      ),
    );
  }
}
