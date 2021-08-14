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
    emailController.addListener(() {
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

  FocusNode emailFocusNode = new FocusNode();
  FocusNode passwordFocusNode = new FocusNode();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

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
                      Flex(
                        direction: Axis.horizontal,
                        children: [
                          Flexible(
                            child: Text(
                              'Novo usuário? ',
                              overflow: TextOverflow.clip,
                              maxLines: 1,
                              style: AppTextStyles.grey16w400Roboto,
                            ),
                          ),
                          Flexible(
                            child: Text(
                              'Crie uma conta',
                              overflow: TextOverflow.clip,
                              maxLines: 1,
                              style: AppTextStyles.blue16w400Roboto,
                            ),
                          ),
                        ],
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
                            onChanged: controller.setEmail,
                            validator: (value) =>
                                Validators().email(value ?? ''),
                            textInputAction: TextInputAction.next,
                            controller: emailController,
                            focusNode: emailFocusNode,
                            keyboardType: TextInputType.emailAddress,
                          ),
                          SizedBox(height: 8.0),
                          controller.showPasswordField
                              ? CustomTextField(
                                  labelText: "Senha",
                                  hintText: "Senha",
                                  obscureText: controller.passwordVisible,
                                  onChanged: controller.setPassword,
                                  errorMessage: controller.passwordError,
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
                                  focusNode: passwordFocusNode,
                                  controller: passwordController,
                                )
                              : Container(),
                          SizedBox(height: 16.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              controller.showPasswordField
                                  ? Text(
                                      'Recuperar senha',
                                      style: AppTextStyles.purple14w500Roboto,
                                    )
                                  : Container(),
                              controller.loading
                                  ? CircularProgressIndicator()
                                  : CircularButtonGradient(
                                      onTap: callLogin,
                                      text: 'Continuar'.toUpperCase(),
                                      disabled: controller.disabledButton,
                                    )
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
                        child:
                            Text("ou", style: AppTextStyles.grey16w400Roboto),
                      ),
                      ElevatedButton(
                        style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50.0),
                                side: BorderSide(color: Colors.grey)),
                          ),
                          backgroundColor:
                              MaterialStateProperty.all(AppColors.white),
                          shadowColor:
                              MaterialStateProperty.all(AppColors.transparent),
                        ),
                        onPressed: () {},
                        child: Flex(
                          direction: Axis.horizontal,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 16,
                              width: 16,
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                    image:
                                        AssetImage('assets/images/google.png'),
                                    fit: BoxFit.fill),
                              ),
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Flexible(
                              child: Text(
                                  "continuar com o google".toUpperCase(),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                  style: AppTextStyles.darkGray13w500Roboto),
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
                            ),
                          ),
                          backgroundColor:
                              MaterialStateProperty.all(AppColors.blueFacebook),
                          shadowColor:
                              MaterialStateProperty.all(AppColors.transparent),
                        ),
                        onPressed: () {},
                        child: Flex(
                          direction: Axis.horizontal,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.facebook,
                              size: 20,
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Flexible(
                              child: Text(
                                  "continuar com o facebook".toUpperCase(),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                  style: AppTextStyles.white13w500Roboto),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 32,
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

  callLogin() {
    if (_formKey.currentState!.validate()) {
      controller
          .login(emailController.text, passwordController.text)
          .then((value) => {});
    }
  }
}
