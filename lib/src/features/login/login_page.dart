import 'dart:ui';

import 'package:flutter/material.dart';

import '../../shared/validators/text_validator.dart';
import '../../shared/widgets/widgets.dart';

import 'package:flutter_mobx/flutter_mobx.dart';
import 'login_controller.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final controller = LoginController();

  @override
  void initState() {
    controller.emailController.addListener(() {
      controller.verifyDig();
    });
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 48),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  HeaderWidget(
                    title: 'Vamos começar!',
                  ),
                  Text(
                    'Novo usuário? Crie uma conta',
                    style: TextStyle(
                      fontFamily: "Roboto",
                      fontSize: 16,
                      letterSpacing: 0.15,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(
                    height: 46,
                  ),
                ],
              ),
              Observer(builder: (_) {
                return Column(
                  children: [
                    CustomTextField(
                      labelText: "E-mail",
                      hintText: "E-mail",
                      validator: (value) => Validators().email(value ?? ''),
                      textInputAction: TextInputAction.next,
                      controller: controller.emailController,
                      keyboardType: TextInputType.emailAddress,
                    ),
                    SizedBox(height: 8.0),
                    controller.showPasswordField
                        ? CustomTextField(
                            labelText: "Senha",
                            hintText: "Senha",
                            obscureText: controller.passwordVisible,
                            suffixIcon: VisibleWidget(
                              visible: controller.passwordVisible,
                              onPressed: () {
                                setState(() {
                                  controller.passwordVisible = !controller.passwordVisible;
                                });
                              },
                            ),
                            textInputAction: TextInputAction.next,
                            controller: controller.passwordController,
                          )
                        : Container(),
                    SizedBox(height: 16.0),
                    Align(
                      alignment: Alignment.centerRight,
                      child: ElevatedButton(
                        onPressed: () {
                          controller.login().then((value) => {});
                        },
                        style: ButtonStyle(
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50.0),
                            ),
                          ),
                        ),
                        child: Text(
                          "CONTINUAR",
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Roboto',
                            fontSize: 14,
                            letterSpacing: 0.4,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                  ],
                );
              }),
              Column(
                children: [
                  Center(
                    child: Text(
                      "Ou",
                      style: TextStyle(
                        color: Colors.grey,
                        fontFamily: 'Roboto',
                        fontSize: 16,
                        letterSpacing: 0.4,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  Flex(
                    direction: Axis.horizontal,
                    children: [
                      Expanded(
                        child: SafeArea(
                          bottom: true,
                          child: ElevatedButton(
                            style: ButtonStyle(
                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50.0),
                                ),
                              ),
                            ),
                            onPressed: () {},
                            child: Row(
                              children: [
                                Align(alignment: Alignment.centerLeft, child: Icon(Icons.android)),
                                Container(
                                  margin: const EdgeInsets.only(left: 10.0),
                                  child: Text(
                                    "continuar com o google",
                                    style: TextStyle(fontSize: 20.0),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Flex(
                    direction: Axis.horizontal,
                    children: [
                      Expanded(
                        child: SafeArea(
                          bottom: true,
                          child: ElevatedButton(
                            style: ButtonStyle(
                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50.0),
                                ),
                              ),
                            ),
                            onPressed: () {},
                            child: Row(
                              children: [
                                Align(alignment: Alignment.centerLeft, child: Icon(Icons.facebook)),
                                Container(
                                  margin: const EdgeInsets.only(left: 10.0),
                                  child: Text(
                                    "continuar com o facebook",
                                    style: TextStyle(fontSize: 20.0),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
