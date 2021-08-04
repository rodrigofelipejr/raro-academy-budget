import 'package:flutter/material.dart';
import 'package:budget/src/shared/constants/app_colors.dart';

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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          height: 74,
        ),
        Hero(
          tag: "notes_logo",
          child: Image.asset(
            "assets/images/logo_with_color.png",
          ),
        ),
        SizedBox(
          height: 16.15,
        ),
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
        SizedBox(
          height: 8,
        ),
      ],
    );
  }
}
