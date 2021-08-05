import 'dart:ui';

import 'package:budget/src/shared/widgets/circular_button_gradient.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'widgets/header_widget.dart';
import 'login_controller.dart';
import '../../../../shared/constants/constants.dart';
import '../../../../shared/widgets/widgets.dart';
import '../../../../shared/validators/text_validator.dart';

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
      if (!controller.showPasswordField) {
        controller.verifyDig();
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 48),
        child: SingleChildScrollView(
          child: ConstrainedBox(
            constraints:
                BoxConstraints(minHeight: MediaQuery.of(context).size.height),
            child: Container(
              child: Column(
                mainAxisSize: MainAxisSize.max,
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
                    return Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          CustomTextField(
                            labelText: "E-mail",
                            hintText: "Insira seu e-mail",
                            errorMessage: null,
                            validator: (value) =>
                                Validators().email(value ?? ''),
                            textInputAction: TextInputAction.next,
                            controller: controller.emailController,
                            focusNode: controller.emailFocusNode,
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
                                        controller.passwordVisible =
                                            !controller.passwordVisible;
                                      });
                                    },
                                  ),
                                  textInputAction: TextInputAction.next,
                                  focusNode: controller.passwordFocusNode,
                                  controller: controller.passwordController,
                                )
                              : Container(),
                          SizedBox(height: 16.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Recuperar senha',
                                style: AppTextStyles.purple14w500Roboto,
                              ),
                              CircularButtonGradient(
                                formKey: _formKey,
                                controller: controller,
                                text: 'Continuar',
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 50,
                          ),
                        ],
                      ),
                    );
                  }),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.end,
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
                      ElevatedButton(
                        style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50.0),
                            ),
                          ),
                        ),
                        onPressed: () {},
                        child: Flex(
                          direction: Axis.horizontal,
                          children: [
                            Icon(Icons.android),
                            SizedBox(
                              width: 8,
                            ),
                            Flexible(
                              child: Text(
                                "continuar com o google",
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                style: TextStyle(fontSize: 20.0),
                              ),
                            ),
                          ],
                        ),
                      ),
                      ElevatedButton(
                        style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50.0),
                                side: BorderSide(color: Colors.red)),
                          ),
                        ),
                        onPressed: () {},
                        child: Flex(
                          direction: Axis.horizontal,
                          children: [
                            Icon(Icons.facebook),
                            SizedBox(
                              width: 8,
                            ),
                            Flexible(
                              child: Text(
                                "continuar com o facebook",
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                style: TextStyle(fontSize: 20.0),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
