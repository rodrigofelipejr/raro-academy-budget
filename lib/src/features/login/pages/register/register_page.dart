import 'package:budget/src/features/login/pages/register/register_store.dart';
import 'package:budget/src/features/login/widgets/header_widget.dart';
import 'package:budget/src/shared/constants/constants.dart';
import 'package:budget/src/shared/models/user_model.dart';
import 'package:budget/src/shared/validators/text_validator.dart';
import 'package:budget/src/shared/widgets/circular_button_gradient_with_icon.dart';
import 'package:budget/src/shared/widgets/widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_mask/easy_mask.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:budget/src/shared/utils/utils.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends ModularState<RegisterPage, RegisterStore> {
  late ReactionDisposer _disposer;
  @override
  void initState() {
    _disposer = reaction<bool>((_) => store.loading, (bool loading) {
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

  final formKeyNameAndEmail = GlobalKey<FormState>();
  final formKeyPhoneAndCpf = GlobalKey<FormState>();
  final formKeyPassword = GlobalKey<FormState>();

  FocusNode emailFocusNode = new FocusNode();
  TextEditingController emailController = TextEditingController();
  FocusNode nameFocusNode = new FocusNode();
  TextEditingController nameController = TextEditingController();

  FocusNode phoneFocusNode = new FocusNode();
  TextEditingController phoneController = TextEditingController();
  FocusNode cpfFocusNode = new FocusNode();
  TextEditingController cpfController = TextEditingController();

  FocusNode passwordFocusNode = new FocusNode();
  TextEditingController passwordController = TextEditingController();
  FocusNode confirmPasswordFocusNode = new FocusNode();
  TextEditingController confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        scrollDirection: Axis.horizontal,
        controller: controller.pageController,
        physics: NeverScrollableScrollPhysics(),
        onPageChanged: controller.updateCurrentPage,
        children: [
          Scaffold(
            body: BodyPageWidget(
              contentPadding: const EdgeInsets.symmetric(horizontal: 48.0),
              child: Container(
                height: MediaQuery.of(context).size.height - 70,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    HeaderWidget(
                      title: 'Bem-vindo!',
                      subtitle: 'Por favor insira seus dados no campos abaixo.',
                    ),
                    Expanded(
                      child: Center(
                        child: Form(
                          key: formKeyNameAndEmail,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CustomTextField(
                                labelText: "Nome",
                                //onChanged: controller.setEmail,
                                validator: (value) => Validators().validateName(value ?? ''),
                                textInputAction: TextInputAction.next,
                                controller: nameController,
                                focusNode: nameFocusNode,
                                keyboardType: TextInputType.name,
                              ),
                              SizedBox(height: 8.0),
                              Observer(
                                builder: (_) => CustomTextField(
                                  labelText: "E-mail",
                                  validator: (value) => Validators().email(value ?? ''),
                                  textInputAction: TextInputAction.next,
                                  controller: emailController,
                                  focusNode: emailFocusNode,
                                  errorMessage: store.errorMessage,
                                  keyboardType: TextInputType.emailAddress,
                                ),
                              ),
                              SizedBox(
                                height: 50,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Scaffold(
            body: BodyPageWidget(
              contentPadding: const EdgeInsets.symmetric(horizontal: 48.0),
              child: Container(
                height: MediaQuery.of(context).size.height - 70,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    HeaderWidget(
                      title: 'Bem-vindo!',
                      subtitle: 'Mais alguns dados.',
                    ),
                    Expanded(
                      child: Center(
                        child: Form(
                          key: formKeyPhoneAndCpf,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CustomTextField(
                                labelText: "Telefone",
                                //onChanged: controller.setEmail,
                                validator: (value) => Validators().phoneValidator(value ?? ''),
                                textInputAction: TextInputAction.next,
                                controller: phoneController,
                                keyboardType: TextInputType.number,
                                inputFormatters: [
                                  TextInputMask(mask: ['(99) 9999-9999', '(99) 99999-9999'])
                                ],
                                onEditingComplete: () {
                                  FocusScope.of(context).nextFocus();
                                },
                              ),
                              SizedBox(height: 8.0),
                              CustomTextField(
                                  labelText: "CPF",
                                  textInputAction: TextInputAction.next,
                                  controller: cpfController,
                                  focusNode: cpfFocusNode,
                                  keyboardType: TextInputType.number,
                                  inputFormatters: [
                                    TextInputMask(mask: ['999.999.999-99'])
                                  ],
                                  validator: (cpf) => Validators().cpfValidator(cpf ?? ''),
                                  helperText: "O CPF é necessário para conectar suas contas."),
                              SizedBox(
                                height: 50,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Scaffold(
            body: SingleChildScrollView(
              child: Container(
                height: MediaQuery.of(context).size.height - 70,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 48),
                      child: HeaderWidget(
                        title: 'Bem-vindo!',
                        subtitle: 'Leia com atenção e aceite.',
                      ),
                    ),
                    Expanded(
                      child: Container(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 27),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                ' Lorem Ipsum neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit. Ipsum neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit. Nque porro  est qui dolorem ipsum quia dolor sit amet, , adipisci velit. Quisquam est qui dolorem ipsum.',
                                style: TextStyle(
                                  fontFamily: "Roboto",
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.darkGray,
                                ),
                              ),
                              SizedBox(
                                height: 24,
                              ),
                              GestureDetector(
                                onTap: () => controller.updatePolicy(!controller.policy),
                                child: Observer(
                                  builder: (_) => ListTile(
                                    horizontalTitleGap: 0,
                                    contentPadding: EdgeInsets.only(),
                                    title: const Text(
                                      'Eu li e aceito os termos e condições e a Política de privacidade do budget.',
                                      style: TextStyle(
                                        fontFamily: "Roboto",
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                        color: AppColors.darkGray,
                                      ),
                                    ),
                                    leading: Checkbox(
                                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                      checkColor: Colors.white,
                                      fillColor: MaterialStateProperty.all(AppColors.azul),
                                      value: controller.policy,
                                      shape: CircleBorder(),
                                      onChanged: (bool? value) {
                                        controller.updatePolicy(value);
                                      },
                                    ),
                                    subtitle: store.showErrorPolicy,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Scaffold(
            body: BodyPageWidget(
              contentPadding: const EdgeInsets.symmetric(horizontal: 48.0),
              child: SingleChildScrollView(
                child: Container(
                  height: MediaQuery.of(context).size.height - 70,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      HeaderWidget(
                        title: 'Bem-vindo!',
                        subtitle: 'Agora crie seu senha contendo:',
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              ' • Pelo menos oito caracteres. ',
                              style: TextStyle(
                                fontFamily: "Roboto",
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: AppColors.darkGray,
                              ),
                            ),
                            Text(
                              ' • Letras maiúsculas, letras minúsculas, números e símbolos.',
                              style: TextStyle(
                                fontFamily: "Roboto",
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: AppColors.darkGray,
                              ),
                            ),
                            SizedBox(
                              height: 50,
                            ),
                            Form(
                              key: formKeyPassword,
                              child: Column(
                                children: [
                                  Observer(
                                    builder: (_) => CustomTextField(
                                      textInputAction: TextInputAction.next,
                                      labelText: "Senha",
                                      controller: passwordController,
                                      focusNode: passwordFocusNode,
                                      obscureText: controller.passwordVisible,
                                      suffixIcon: ButtonIconVisibleWidget(
                                        colorIcon: AppColors.black54,
                                        showing: controller.passwordVisible,
                                        onTap: () => controller.updatePasswordVisible(!controller.passwordVisible),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 8.0),
                                  Observer(
                                    builder: (_) => CustomTextField(
                                      labelText: "Confirmar Senha",
                                      controller: confirmPasswordController,
                                      focusNode: confirmPasswordFocusNode,
                                      validator: (value) => Validators().validatePassword(
                                        value ?? '',
                                        passwordController.value.text,
                                      ),
                                      obscureText: controller.confirmPasswordVisible,
                                      suffixIcon: ButtonIconVisibleWidget(
                                        colorIcon: AppColors.black54,
                                        showing: controller.confirmPasswordVisible,
                                        onTap: () =>
                                            controller.updateConfirmPasswordVisible(!controller.confirmPasswordVisible),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Flex(
          direction: Axis.horizontal,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () => {
                controller.popPage(),
              },
              child: Flexible(
                child: Flex(
                  direction: Axis.horizontal,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.arrow_back,
                      size: 18,
                      color: AppColors.darkGray,
                    ),
                    SizedBox(
                      width: 11,
                    ),
                    Text(
                      'VOLTAR',
                      style: AppTextStyles.darkGray14w500Roboto,
                    ),
                  ],
                ),
              ),
            ),
            Observer(
              builder: (_) => Flexible(
                child: Text(
                  '${(controller.currentPage + 1).toString()} / 4',
                  overflow: TextOverflow.clip,
                  maxLines: 1,
                  style: AppTextStyles.black16w400Roboto,
                ),
              ),
            ),
            Flexible(
              child: CircularButtonGradientWithIcon(
                text: 'Continuar'.toUpperCase(),
                onTap: () => {nextPage()},
              ),
            ),
          ],
        ),
      ),
    );
  }

  void nextPage() {
    if (store.currentPage == 0) {
      if (formKeyNameAndEmail.currentState!.validate()) {
        store.pushPage();
      }
    } else if (store.currentPage == 1) {
      if (formKeyPhoneAndCpf.currentState!.validate()) {
        store.pushPage();
      }
    } else if (store.currentPage == 2) {
      if (store.policy == true) {
        store.pushPage();
        store.updateErrorPolicy(false);
      } else {
        store.updateErrorPolicy(true);
      }
    } else if (store.currentPage == 3) {
      if (formKeyPassword.currentState!.validate()) {
        store.login(
            UserModel(
              cpf: this.cpfController.text.onlyNumbers(),
              name: this.nameController.text,
              phone: this.phoneController.text.onlyNumbers(),
              termsAndConditions: store.policy,
              uuid: '',
            ),
            this.emailController.text,
            this.passwordController.text,
            context);
      }
    }
  }
}
