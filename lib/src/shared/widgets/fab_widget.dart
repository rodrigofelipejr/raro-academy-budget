import 'package:flutter/material.dart';

import '../constants/constants.dart';
import 'animated_switcher_widget.dart';

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
  BorderRadius? get borderRadiusGradient => withDescription ? BorderRadius.circular(size) : null;
  BorderRadius? get borderRadius => BorderRadius.circular(size);
  BoxShape get shape => withDescription ? BoxShape.rectangle : BoxShape.circle;
  double get widthSizedBox => withDescription ? 4.0 : 0;
  double? get widthContainer => withDescription ? null : size;
  EdgeInsets get paddingContainer =>
      withDescription ? const EdgeInsets.only(left: 14.0, right: 18.0) : const EdgeInsets.all(14.0);

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcherWidget(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: AppGradients.blueGradientButtons,
              shape: shape,
              borderRadius: borderRadiusGradient,
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
                  padding: paddingContainer,
                  height: size,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
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
      ),
    );
  }
}
