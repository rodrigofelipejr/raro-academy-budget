import 'package:budget/src/shared/constants/app_colors.dart';
import 'package:flutter/material.dart';

<<<<<<< HEAD:lib/src/features/login/pages/widgets/header_widget.dart
=======
import '../../../../../shared/constants/constants.dart';
import '../../../../../shared/constants/app_colors.dart';

>>>>>>> dev:lib/src/features/login/pages/login/widgets/header_widget.dart
class HeaderWidget extends StatelessWidget {
  const HeaderWidget({
    Key? key,
    this.title,
    this.subtitle,
  }) : super(key: key);

  final String? title;
  final String? subtitle;

  @override
  Widget build(BuildContext context) {
    final sizeScreen = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 74.0),
          child: SizedBox(
            width: sizeScreen.width * 0.29,
            child: Image.asset(
              AppImages.logoBudgetBlue,
            ),
          ),
        ),
        SizedBox(height: 16.15),
        Text(
          title ?? '',
          style: TextStyle(
            fontFamily: "Roboto",
            fontSize: 48,
            fontWeight: FontWeight.w400,
            color: AppColors.ciano,
          ),
        ),
        subtitle != null
            ? Text(
                subtitle ?? '',
                style: TextStyle(
                  fontFamily: "Roboto",
                  fontSize: 20,
                  color: AppColors.azul,
                  fontWeight: FontWeight.w500,
                ),
              )
            : Container(),
        SizedBox(height: 8),
      ],
    );
  }
}
