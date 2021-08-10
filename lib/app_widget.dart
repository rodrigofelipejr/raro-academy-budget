import 'package:budget/src/features/home/home_page.dart';
import 'package:budget/src/features/splash/splash_page.dart';
import 'package:budget/src/shared/auth/auth_controller.dart';
import 'package:flutter/material.dart';

import 'src/features/login/page/login/login_page.dart';

class AppWidget extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: AuthController.instance.navigatorKey,
      title: 'Flutterlistener Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: "/splash",
      routes: {
        "/splash": (_) => SplashPage(),
        "/login": (_) => LoginPage(),
        "/home": (_) => HomePage()
      },
    );
  }
}
