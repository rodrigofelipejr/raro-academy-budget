import 'package:flutter/material.dart';

import '../constants/constants.dart';
import '../models/item_menu.dart';
import 'menu_widget.dart';
import 'sub_menu_widget.dart';

class BodyDrawerWidget extends StatelessWidget {
  const BodyDrawerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
        ...Constants.menuItems.map((e) {
          switch (e.type) {
            case TypeMenuItem.menu:
              return MenuWidget(label: e.description ?? '');

            case TypeMenuItem.subMenu:
              return SubMenuWidget(
                label: e.description ?? '',
                onTap: e.onTap,
              );

            case TypeMenuItem.divider:
              return Divider(height: 1.0);
          }
        }).toList(),
      ],
    );
  }
}
