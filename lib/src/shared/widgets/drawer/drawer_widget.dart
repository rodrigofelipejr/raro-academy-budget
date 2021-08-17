import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../constants/constants.dart';
import '../../stores/auth/auth_store.dart';
import '../widgets.dart';
import 'widgets/body_drawer_widget.dart';
import 'widgets/footer_drawer_widget.dart';
import 'widgets/header_drawer_widget.dart';

class DrawerWidget extends StatefulWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  _DrawerWidgetState createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  late final AuthStore _authStore;

  @override
  void initState() {
    _authStore = Modular.get<AuthStore>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          HeaderDrawerWidget(
            label: _authStore.welcomeMessage,
          ),
          Expanded(
            child: BodyDrawerWidget(),
          ),
          FooterDrawerWidget(
            onTap: () async {
              Navigator.pop(context);
              OverlayWidget.show(context, label: AppStrings.msgLogoffApp);
              await Future.delayed(Duration(milliseconds: 300));
              await _authStore.logoffUser();
              OverlayWidget.hide();
            },
          ),
        ],
      ),
    );
  }
}
