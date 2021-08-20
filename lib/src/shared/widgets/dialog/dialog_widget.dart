import 'package:flutter/material.dart';

import '../../constants/constants.dart';
import '../../utils/utils.dart';
import '../text_button_widget.dart';

import 'dialog_types_enum.dart';

class DialogWidget extends StatelessWidget {
  final DialogTypeEnum type;
  final String title;
  final String message;
  final String? textButtonPrimary;
  final Future<void> Function()? onPressedPrimary;
  final String? textButtonSecondary;
  final Future<void> Function()? onPressedSecondary;

  const DialogWidget({
    Key? key,
    required this.type,
    required this.title,
    required this.message,
    this.textButtonPrimary,
    this.onPressedPrimary,
    this.textButtonSecondary = 'Cancelar',
    this.onPressedSecondary,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.topCenter,
        children: [
          Container(
            margin: EdgeInsets.symmetric(
              horizontal: screenWidthPercentage(context, percentage: 0.04),
            ),
            padding: const EdgeInsets.only(top: 32.0, left: 16.0, right: 16.0, bottom: 12.0),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(16.0),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: 16.0),
                Text(
                  title,
                  style: AppTextStyles.black24w400Roboto,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 8.0),
                Container(
                  alignment: Alignment.center,
                  child: Text(
                    message,
                    style: AppTextStyles.black16w400Roboto,
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: 26.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    TextButtonWidget(
                      label: textButtonSecondary!,
                      onPressed: () async {
                        (onPressedSecondary != null) ? await onPressedSecondary!() : Navigator.pop(context);
                      },
                      type: TextButtonType.secondary,
                    ),
                    if (textButtonPrimary != null)
                      TextButtonWidget(
                        label: textButtonPrimary!,
                        onPressed: () async {
                          (onPressedPrimary != null) ? await onPressedPrimary!() : Navigator.pop(context);
                        },
                      ),
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            top: -28,
            child: CircleAvatar(
              minRadius: 16,
              maxRadius: 28,
              backgroundColor: _avatarColorByType(type),
              child: Icon(
                _avatarIconByType(type),
                size: 28,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Color _avatarColorByType(DialogTypeEnum type) {
  switch (type) {
    case DialogTypeEnum.error:
      return AppColors.redLight;
    case DialogTypeEnum.success:
      return AppColors.greenLight;
    case DialogTypeEnum.warning:
      return AppColors.orangeLight;
    default:
      return AppColors.blueLight;
  }
}

IconData _avatarIconByType(DialogTypeEnum type) {
  switch (type) {
    case DialogTypeEnum.error:
      return Icons.close;
    case DialogTypeEnum.warning:
      return Icons.warning_amber;
    case DialogTypeEnum.success:
      return Icons.check;
    default:
      return Icons.info;
  }
}
