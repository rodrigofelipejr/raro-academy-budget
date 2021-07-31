import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../constants/constants.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const AppBarWidget({Key? key, required this.title}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: AppGradients.blueGradientAppBar,
        boxShadow: AppShadows.shadowsAppBar,
      ),
      child: AppBar(
        title: Text(
          title,
          style: AppTextStyles.white24w400Roboto.copyWith(
            shadows: AppShadows.shadowsTextAppBar,
          ),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: AppColors.transparent,
        backwardsCompatibility: false,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: AppColors.transparent,
          statusBarIconBrightness: Brightness.light,
        ),
      ),
    );
  }
}
