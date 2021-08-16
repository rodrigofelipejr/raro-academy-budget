import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../shared/constants/constants.dart';
import 'splash_store.dart';
import 'widgets/widgets.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends ModularState<SplashPage, SplashStore> {
  @override
  void initState() {
    SystemChannels.textInput.invokeMethod('TextInput.hide');
    SystemChrome.setEnabledSystemUIOverlays([]);
    // FIXME - Verificar como implementar essa logica.
    WidgetsFlutterBinding.ensureInitialized().addPostFrameCallback((timeStamp) {
      // FIXME - deve ser revisto, quando o usuário já está logado
      Future.delayed(Duration(seconds: 3)).then(
        (value) => Modular.to.pushReplacementNamed(AppRoutes.login),
      );
    });
    store.init();
    super.initState();
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
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
