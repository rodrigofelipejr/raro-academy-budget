import 'package:flutter/material.dart';

import '../../../constants/constants.dart';

class MenuWidget extends StatelessWidget {
  final String label;

  const MenuWidget({Key? key, required this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(26.0, 14.0, 14.0, 8.0),
      child: Text(
        label,
        style: AppTextStyles.black14w400Roboto,
      ),
    );
  }
}
