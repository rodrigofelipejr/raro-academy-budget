import 'package:flutter/material.dart';

import '../../constants/constants.dart';
import '../../utils/utils.dart';
import '../text_button_widget.dart';

class DialogOptionsItem {
  final String label;
  final Future<void> Function() onTap;

  DialogOptionsItem({
    required this.label,
    required this.onTap,
  });
}

class DialogOptionsWidget extends StatelessWidget {
  final String title;
  final String message;
  final List<DialogOptionsItem> options;
  final Axis axis;

  const DialogOptionsWidget({
    Key? key,
    required this.title,
    required this.message,
    required this.options,
    this.axis = Axis.vertical,
  }) : super(key: key);

  List<Widget> _buildOptions(BuildContext context) {
    return options
        .map(
          (e) => TextButtonWidget(
            label: e.label,
            onPressed: () async {
              Navigator.pop(context);
              await e.onTap();
            },
          ),
        )
        .toList();
  }

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
                  if (axis == Axis.horizontal)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: _buildOptions(context),
                    ),
                  if (axis == Axis.vertical)
                    Column(
                      children: _buildOptions(context),
                    ),
                ],
              ),
            ),
            Positioned(
              top: -28,
              child: CircleAvatar(
                minRadius: 16,
                maxRadius: 28,
                backgroundColor: AppColors.blueLight,
                child: Icon(
                  Icons.library_add_check,
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
