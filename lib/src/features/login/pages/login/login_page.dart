import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../../../../shared/constants/constants.dart';
import '../../../../shared/utils/utils.dart';
import '../../../../shared/validators/validators.dart';
import '../../../../shared/widgets/widgets.dart';
import '../../widgets/widgets.dart';
import 'stores/login_store.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends ModularState<LoginPage, LoginStore> with KeyboardManager {
  FocusNode emailFocusNode = new FocusNode();
  FocusNode passwordFocusNode = new FocusNode();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  late ReactionDisposer _disposer;

  @override
  void initState() {
    _disposer = reaction<bool>((_) => store.isLoading, (bool loading) {
      (loading)
          ? OverlayWidget.show(context, label: AppStrings.txtLoginApp)
          : Future.delayed(Duration(milliseconds: 300)).then((value) => OverlayWidget.hide());
    });
    super.initState();
  }

  @override
  void dispose() {
    _disposer();
    super.dispose();
  }

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BodyPageWidget(
        contentPadding: const EdgeInsets.symmetric(horizontal: 48.0),
        child: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: MediaQuery.of(context).size.height),
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
                            child: GestureDetector(
                              onTap: () => {
                                Modular.to.pushNamed(AppRoutes.register),
                              },
                              child: Text(
                                'Crie uma conta',
                                overflow: TextOverflow.clip,
                                maxLines: 1,
                                style: AppTextStyles.blue16w400Roboto,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 23,
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
                            onChanged: (value) => store.onChange(email: value),
                            validator: (value) => Validators().email(value ?? ''),
                            textInputAction: TextInputAction.next,
                            controller: emailController,
                            focusNode: emailFocusNode,
                            keyboardType: TextInputType.emailAddress,
                          ),
                          SizedBox(height: 8.0),
                          Visibility(
                            visible: store.showPasswordField,
                            child: CustomTextField(
                              labelText: "Senha",
                              hintText: "Senha",
                              obscureText: store.state.passwordContentVisible,
                              onChanged: (value) => store.onChange(password: value),
                              errorMessage: store.state.passwordError,
                              suffixIcon: ButtonIconVisibleWidget(
                                colorIcon: AppColors.black54,
                                showing: store.state.passwordContentVisible,
                                onTap: () => store.onChange(
                                  passwordContentVisible: !store.state.passwordContentVisible,
                                ),
                              ),
                              textInputAction: TextInputAction.done,
                              keyboardType: TextInputType.visiblePassword,
                              focusNode: passwordFocusNode,
                              controller: passwordController,
                            ),
                          ),
                          SizedBox(height: 16.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Visibility(
                                visible: store.showPasswordField,
                                child: Text(
                                  'Recuperar senha',
                                  style: AppTextStyles.purple14w500Roboto,
                                ),
                              ),
                              CircularButtonGradient(
                                text: 'Continuar'.toUpperCase(),
                                disabled: store.disabledButton,
                                onTap: () {
                                  hideKeyboard(context);
                                  if (_formKey.currentState!.validate()) {
                                    controller.login().then((value) {
                                      if (value) Modular.to.pushReplacementNamed(AppRoutes.home);
                                    });
                                  }
                                },
                              )
                            ],
                          ),
                          SizedBox(height: 25),
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
                        child: Text("ou", style: AppTextStyles.grey16w400Roboto),
                      ),
                      ElevatedButton(
                        style: ButtonStyle(
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50.0),
                              side: BorderSide(color: Colors.grey),
                            ),
                          ),
                          backgroundColor: MaterialStateProperty.all(AppColors.white),
                          shadowColor: MaterialStateProperty.all(AppColors.transparent),
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
                                image: DecorationImage(image: AssetImage(AppImages.icGoogle), fit: BoxFit.fill),
                              ),
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Flexible(
                              child: Text("continuar com o google".toUpperCase(),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                  style: AppTextStyles.darkGray13w500Roboto),
                            ),
                          ],
                        ),
                      ),
                      ElevatedButton(
                        style: ButtonStyle(
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0)),
                          ),
                          backgroundColor: MaterialStateProperty.all(AppColors.blueFacebook),
                          shadowColor: MaterialStateProperty.all(AppColors.transparent),
                        ),
                        onPressed: () {},
                        child: Flex(
                          direction: Axis.horizontal,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.facebook, size: 20),
                            SizedBox(width: 8),
                            Flexible(
                              child: Text("continuar com o facebook".toUpperCase(),
                                  overflow: TextOverflow.ellipsis, maxLines: 1, style: AppTextStyles.white13w500Roboto),
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: 16),
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
