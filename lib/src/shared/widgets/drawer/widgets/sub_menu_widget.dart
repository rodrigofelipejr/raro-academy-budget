import 'package:flutter/material.dart';

import '../../../constants/constants.dart';

class SubMenuWidget extends StatelessWidget {
  final String label;
  final void Function()? onTap;
  final EdgeInsetsGeometry padding;
  final TextAlign? textAlign;

  const SubMenuWidget({
    Key? key,
    required this.label,
    this.onTap,
    this.padding = const EdgeInsets.fromLTRB(26.0, 16.0, 14.0, 16.0),
    this.textAlign = TextAlign.left,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: padding,
        child: Text(
          label,
          style: AppTextStyles.black16w500Roboto,
          textAlign: textAlign,
        ),
      ),
    );
  }
}
