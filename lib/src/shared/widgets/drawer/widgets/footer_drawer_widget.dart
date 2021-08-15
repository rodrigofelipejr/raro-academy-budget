import 'package:flutter/material.dart';

import 'sub_menu_widget.dart';

class FooterDrawerWidget extends StatelessWidget {
  const FooterDrawerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Divider(height: 1),
        SubMenuWidget(
          label: 'Sair',
          onTap: () {},
          textAlign: TextAlign.center,
          padding: const EdgeInsets.symmetric(vertical: 16.0),
        ),
      ],
    );
  }
}
