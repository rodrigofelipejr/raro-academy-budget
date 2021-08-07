import 'package:flutter/material.dart';

import '../constants/constants.dart';

class FabWidget extends StatelessWidget {
  final void Function() onTap;
  final String? label;

  const FabWidget({
    Key? key,
    required this.onTap,
    this.label,
  }) : super(key: key);

  const FabWidget.description({
    Key? key,
    required this.onTap,
    required this.label,
  }) : super(key: key);

  bool get withDescription => label != null;
  double get size => withDescription ? 44 : 56;
  BorderRadius? get borderRadius => withDescription ? BorderRadius.circular(size) : null;
  BoxShape get shape => withDescription ? BoxShape.rectangle : BoxShape.circle;
  double get widthSizedBox => withDescription ? 4.0 : 0;
  double? get widthContainer => withDescription ? null : size;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
            gradient: AppGradients.blueGradientButtons,
            shape: shape,
            borderRadius: borderRadius,
            boxShadow: AppShadows.shadowsFab,
          ),
          child: Material(
            color: AppColors.transparent,
            borderRadius: borderRadius,
            child: InkWell(
              borderRadius: borderRadius,
              onTap: onTap,
              child: Container(
                width: widthContainer,
                padding: const EdgeInsets.only(left: 14.0, right: 18.0),
                height: size,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                    SizedBox(width: widthSizedBox),
                    Text(
                      label?.toUpperCase() ?? '',
                      style: AppTextStyles.white14w500Roboto,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
