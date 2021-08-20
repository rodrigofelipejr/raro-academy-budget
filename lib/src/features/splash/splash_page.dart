import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../../shared/constants/constants.dart';
import 'splash_store.dart';
import 'widgets/widgets.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends ModularState<SplashPage, SplashStore> {
  late ReactionDisposer _disposer;

  @override
  void initState() {
    SystemChannels.textInput.invokeMethod('TextInput.hide');

    _disposer = reaction<String>((_) => store.navigation, (String route) {
      if (route.isNotEmpty) Modular.to.pushReplacementNamed(route);
    });

    store.init();
    super.initState();
  }

  @override
  void dispose() {
    _disposer();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: AppGradients.blueGradient,
        ),
        child: Column(
          children: [
            Expanded(
              child: BodySplashWidget(),
            ),
            FooterSplashWidget(),
          ],
        ),
      ),
    );
  }
}
