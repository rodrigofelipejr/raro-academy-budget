import 'package:flutter/material.dart';

import '../../constants/constants.dart';
import '../../utils/utils.dart';
import '../text_button_widget.dart';

import 'dialog_types_enum.dart';

Color _avatarColorByType(DialogTypeEnum type) {
  switch (type) {
    case DialogTypeEnum.error:
      return AppColors.redLight;
    case DialogTypeEnum.success:
      return AppColors.greenLight;
    case DialogTypeEnum.warning:
      return AppColors.orangeLight;
    case DialogTypeEnum.confirm:
    case DialogTypeEnum.info:
      return AppColors.blueLight;
    default:
      return AppColors.transparent;
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
    case DialogTypeEnum.confirm:
      return Icons.help_outline;
    case DialogTypeEnum.info:
      return Icons.info;
    default:
      return Icons.info;
  }
}

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
    this.type = DialogTypeEnum.basic,
    required this.title,
    required this.message,
    this.textButtonPrimary,
    this.onPressedPrimary,
    this.textButtonSecondary = 'Cancelar',
    this.onPressedSecondary,
  }) : super(key: key);

  DialogWidget.confirmation({
    Key? key,
    this.type = DialogTypeEnum.confirm,
    this.title = AppStrings.txtConfirmar,
    required this.message,
    this.textButtonPrimary,
    this.onPressedPrimary,
    this.textButtonSecondary = 'Cancelar',
    this.onPressedSecondary,
  }) : super(key: key);

  DialogWidget.error({
    Key? key,
    this.type = DialogTypeEnum.error,
    this.title = AppStrings.txtAlgoDeuErrado,
    required this.message,
    this.textButtonPrimary,
    this.onPressedPrimary,
    this.textButtonSecondary = 'Voltar',
    this.onPressedSecondary,
  }) : super(key: key);

  DialogWidget.information({
    Key? key,
    this.type = DialogTypeEnum.info,
    this.title = AppStrings.txtImportante,
    required this.message,
    this.textButtonPrimary,
    this.onPressedPrimary,
    this.textButtonSecondary = 'Voltar',
    this.onPressedSecondary,
  }) : super(key: key);

  DialogWidget.success({
    Key? key,
    this.type = DialogTypeEnum.success,
    this.title = AppStrings.txtTudoCerto,
    required this.message,
    this.textButtonPrimary,
    this.onPressedPrimary,
    this.textButtonSecondary = 'Fechar',
    this.onPressedSecondary,
  }) : super(key: key);

  DialogWidget.warning({
    Key? key,
    this.type = DialogTypeEnum.warning,
    this.title = AppStrings.txtAtencao,
    required this.message,
    this.textButtonPrimary,
    this.onPressedPrimary,
    this.textButtonSecondary = 'Fechar',
    this.onPressedSecondary,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Center(
        child: Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.topCenter,
          children: [
            Container(
              margin: EdgeInsets.symmetric(
                horizontal: screenWidthPercentage(context, percentage: 0.04),
              ),
              padding: const EdgeInsets.only(top: 32.0, left: 16.0, right: 16.0, bottom: 20.0),
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
                  Text(
                    message,
                    style: AppTextStyles.black16w400Roboto,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 18.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      TextButtonWidget(
                        label: textButtonSecondary!,
                        border: true,
                        onPressed: () async {
                          Navigator.pop(context);
                          if (onPressedSecondary != null) await onPressedSecondary!();
                        },
                        type: TextButtonType.secondary,
                      ),
                      if (textButtonPrimary != null)
                        TextButtonWidget(
                          label: textButtonPrimary!,
                          border: true,
                          onPressed: () async {
                            Navigator.pop(context);
                            if (onPressedPrimary != null) await onPressedPrimary!();
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
      ),
    );
  }
}
