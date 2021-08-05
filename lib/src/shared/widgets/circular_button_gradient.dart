import 'package:budget/src/features/login/page/login/login_controller.dart';
import 'package:budget/src/shared/constants/app_gradients.dart';
import 'package:budget/src/shared/constants/constants.dart';
import 'package:flutter/material.dart';

class CircularButtonGradient extends StatelessWidget {
  const CircularButtonGradient({
    Key? key,
    required GlobalKey<FormState> formKey,
    required this.controller,
    required this.text,
    this.onTap,
  })  : _formKey = formKey,
        super(key: key);

  final GlobalKey<FormState> _formKey;
  final LoginController controller;
  final String text;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: AppGradients.blueGradientButtons,
        borderRadius: BorderRadius.circular(34.0),
        boxShadow: AppShadows.shadowsButtons,
      ),
      child: Material(
        borderRadius: BorderRadius.circular(34.0),
        color: AppColors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(34.0),
          onTap: () => {
            if (_formKey.currentState!.validate())
              {
                controller
                    .login(controller.emailController.text,
                        controller.passwordController.text)
                    .then((value) => {})
              }
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
            child: Text(
              text,
              style: AppTextStyles.white14w500Roboto,
            ),
          ),
        ),
      ),
    );
  }
}
