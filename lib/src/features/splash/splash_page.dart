import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:animated_card/animated_card.dart';

import 'package:budget/src/features/login/login_page.dart';
import 'package:budget/src/shared/constants/constants.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    WidgetsFlutterBinding.ensureInitialized().addPostFrameCallback((timeStamp) {
      Future.delayed(Duration(seconds: 3)).then(
        (value) => Navigator.of(context).push(
          CupertinoPageRoute(
            builder: (BuildContext context) => LoginPage(),
          ),
        ),
      );
    });
    super.initState();
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
        child: Stack(
          alignment: Alignment.center,
          children: [
            AnimatedCard(
              direction: AnimatedCardDirection.top,
              duration: Duration(seconds: 1),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Positioned(
                    top: (MediaQuery.of(context).size.height / 2) - 100,
                    child: Hero(
                      tag: "notes_logo",
                      child: Image.asset(
                        "assets/images/logo_splash.png",
                      ),
                    ),
                  ),
                  Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Hero(
                          tag: "journal",
                          child: Material(
                            color: Colors.transparent,
                            child: Text(
                              "budget",
                              style: AppTextStyles.white72w700Montserrat,
                            ),
                          ),
                        ),
                        Text(
                          "YOUR WALLET’S BEST FRIEND",
                          style: AppTextStyles.white13w300Montserrat,
                          textAlign: TextAlign.end,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            AnimatedCard(
              direction: AnimatedCardDirection.bottom,
              duration: Duration(seconds: 1),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "powered by",
                      style: AppTextStyles.white12w200Roboto,
                    ),
                    SizedBox(
                      height: 8.0,
                    ),
                    Image.asset("assets/images/raro_academy_logo.png"),
                    SizedBox(height: 40.0)
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
