import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_finance_controller/src/features/list_note/list_note_page.dart';
import 'package:flutter_finance_controller/src/shared/constants/app_colors.dart';
import 'package:flutter_finance_controller/src/shared/constants/text_styles.dart';
import 'package:flutter_finance_controller/src/shared/validators/text_validator.dart';
import 'package:flutter_finance_controller/src/shared/widget/custom_text_field.dart';
import 'package:flutter_finance_controller/src/shared/widget/visible_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool passwordVisible = true;
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 48),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 144,
              ),
              Text(
                'Vamos começar!',
                style: TextStyle(
                  fontFamily: "Roboto",
                  fontSize: 48,
                  fontWeight: FontWeight.w400,
                  color: AppColors.ciano,
                ),
              ),
              SizedBox(
                height: 8,
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
              CustomTextField(
                labelText: "E-mail",
                hintText: "E-mail",
                validator: (value) => Validators().email(value ?? ''),
                textInputAction: TextInputAction.next,
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(height: 8.0),
              // CustomTextField(
              //   labelText: "Senha",
              //   hintText: "Senha",
              //   obscureText: passwordVisible,
              //   suffixIcon: VisibleWidget(
              //     visible: passwordVisible,
              //     onPressed: () {
              //       setState(() {
              //         passwordVisible = !passwordVisible;
              //       });
              //     },
              //   ),
              //   textInputAction: TextInputAction.next,
              //   controller: _passwordController,
              // ),
              SizedBox(height: 16.0),
              Align(
                alignment: Alignment.centerRight,
                child: ElevatedButton(
                  onPressed: () {},
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
                      fontFamily: 'Quicksand',
                      fontSize: 14,
                      letterSpacing: 0.4,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
