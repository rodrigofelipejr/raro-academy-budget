import 'package:flutter/material.dart';

import '../constants/constants.dart';

enum TextButtonType { primary, secondary }

class TextButtonWidget extends StatelessWidget {
  final void Function()? onPressed;
  final String label;
  final TextButtonType type;
  final bool border;

  const TextButtonWidget({
    Key? key,
    required this.label,
    this.onPressed,
    this.type = TextButtonType.primary,
    this.border = false,
  }) : super(key: key);

  Color get color => type == TextButtonType.primary ? AppColors.roxo : AppColors.black54;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        border: border ? Border.all(width: 1, color: AppColors.lightGray) : null,
      ),
      child: TextButton(
        onPressed: onPressed,
        child: Container(
          constraints: BoxConstraints(minWidth: 100.0),
          alignment: Alignment.center,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 12.0),
            child: Text(
              label,
              style: AppTextStyles.black16w500Roboto.copyWith(color: color),
            ),
          ),
        ),
      ),
    );
  }
}
