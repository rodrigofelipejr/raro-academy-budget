import 'package:flutter/material.dart';

import 'sub_menu_widget.dart';

class FooterDrawerWidget extends StatelessWidget {
  final Function()? onTap;

  const FooterDrawerWidget({Key? key, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Divider(height: 1),
        SubMenuWidget(
          label: 'Sair',
          onTap: onTap,
          textAlign: TextAlign.center,
          padding: const EdgeInsets.symmetric(vertical: 16.0),
        ),
      ],
    );
  }
}
