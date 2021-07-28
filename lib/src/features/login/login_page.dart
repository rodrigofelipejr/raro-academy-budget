import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_finance_controller/src/features/list_note/list_note_page.dart';
import 'package:flutter_finance_controller/src/shared/constants/app_colors.dart';
import 'package:flutter_finance_controller/src/shared/constants/text_styles.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SafeArea(
            top: true,
            child: Image.asset(
              "assets/images/empty_notes_background.png",
              fit: BoxFit.scaleDown,
            ),
          ),
          Align(
            alignment: Alignment(Alignment.center.x, -0.33),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Hero(
                  tag: "notes_logo",
                  child: Image.asset(
                    "assets/images/notes_logo.png",
                  ),
                ),
                Hero(
                  tag: "journal",
                  child: Material(
                    color: Colors.transparent,
                    child: Text(
                      "journal",
                      style: TextStyles.white48w700Montserrat,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Card(
              margin: EdgeInsets.zero,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10.0),
                  topRight: Radius.circular(10.0),
                ),
              ),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.4,
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 24.0,
                    left: 40.0,
                    right: 40.0,
                  ),
                  child: Flex(
                    direction: Axis.vertical,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Flexible(
                        child: Text(
                          "Não importa onde você esteja! Guarde suas ideias pra depois ;)",
                          style: TextStyles.roxo24w400Roboto,
                        ),
                      ),
                      SizedBox(height: 24.0),
                      Text(
                        "Comece agora a criar as suas notas!",
                        style: TextStyles.ciano16w400Roboto,
                      )
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: InkWell(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (BuildContext context) => ListNotePage(),
            ),
          );
        },
        child: Container(
          width: 56.0,
          height: 56.0,
          decoration: BoxDecoration(
            gradient: AppColors.blueGradient,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.12),
                offset: Offset(0.0, 1.0),
                blurRadius: 18.0,
              ),
              BoxShadow(
                color: Colors.black.withOpacity(0.14),
                offset: Offset(0.0, 6.0),
                blurRadius: 10.0,
              ),
              BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  offset: Offset(0.0, 3),
                  blurRadius: 5.0,
                  spreadRadius: -1.0),
            ],
          ),
          child: Center(
            child: Icon(
              Icons.add,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
