import 'package:flutter/material.dart';

import 'widgets/body_drawer_widget.dart';
import 'widgets/footer_drawer_widget.dart';
import 'widgets/header_drawer_widget.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          HeaderDrawerWidget(
            label: 'Olá, José', //TODO - buscar em Auth
          ),
          Expanded(
            child: BodyDrawerWidget(),
          ),
          FooterDrawerWidget(),
        ],
      ),
    );
  }
}
