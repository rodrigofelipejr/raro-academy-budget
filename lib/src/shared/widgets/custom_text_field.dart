import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../constants/constants.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    this.errorMessage,
    this.hintText,
    this.labelText,
    this.helperText,
    this.obscureText = false,
    this.onChanged,
    this.inputFormatters,
    this.controller,
    this.icon,
    this.suffixIcon,
    this.suffix,
    this.focusNode,
    this.keyboardType,
    this.textInputAction,
    this.onEditingComplete,
    this.validator,
    this.prefixIcon,
  }) : super(key: key);

  final String? errorMessage;

  final String? hintText;
  final String? labelText;
  final String? helperText;
  final bool obscureText;
  final ValueChanged<String>? onChanged;
  final String? Function(String?)? validator;
  final List<TextInputFormatter>? inputFormatters;
  final TextEditingController? controller;
  final Widget? icon;
  final Widget? suffixIcon;
  final Widget? suffix;
  final FocusNode? focusNode;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final Function()? onEditingComplete;
  final Icon? prefixIcon;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyle(color: Colors.black),
      onChanged: onChanged,
      obscureText: obscureText,
      controller: controller,
      focusNode: focusNode,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      onEditingComplete: onEditingComplete,
      validator: validator,
      inputFormatters: inputFormatters,
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        hintStyle: TextStyle(
          color: Colors.grey,
          fontFamily: 'roboto',
          fontSize: 16,
          fontWeight: FontWeight.w400,
        ),
        labelStyle: TextStyle(
          color: AppColors.azul,
          fontFamily: 'roboto',
          fontSize: 16,
          fontWeight: FontWeight.w400,
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey,
          ),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            width: 2,
            color: AppColors.azul,
          ),
        ),
        icon: icon,
        suffix: suffix,
        labelText: labelText,
        helperText: helperText,
        errorBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.red,
          ),
        ),
        errorText: errorMessage,
        errorStyle: TextStyle(color: Colors.grey),
      ),
    );
  }
}
