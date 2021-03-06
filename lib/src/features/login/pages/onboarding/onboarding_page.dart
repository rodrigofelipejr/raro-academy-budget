import 'package:budget/src/shared/constants/app_colors.dart';
import 'package:budget/src/shared/constants/app_gradients.dart';
import 'package:budget/src/shared/constants/constants.dart';
import 'package:budget/src/shared/widgets/circular_button_with_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({Key? key}) : super(key: key);

  @override
  _OnboardingPageState createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ConstrainedBox(
            constraints: BoxConstraints(minHeight: MediaQuery.of(context).size.height),
            child: Image.asset(
              "assets/images/background_onboard.png",
              fit: BoxFit.fill,
            ),
          ),
          Container(
            decoration: BoxDecoration(
              gradient: AppGradients.blueGradientOnboard,
            ),
          ),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 45),
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: MediaQuery.of(context).size.height),
                child: Container(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Container(
                          width: 190,
                          height: 125,
                          child: Image.asset(
                            "assets/images/ic_budget_no_margin.png",
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                      ),
                      Text(
                        'Agora sim! \nVoc?? ter?? o\ncontrole\nfinanceiro nas\nsuas m??os!',
                        style: AppTextStyles.cyan34w700Roboto,
                      ),
                      SizedBox(
                        height: 24,
                      ),
                      CircularButtonGradientWithColor(
                        text: 'VAMOS L??!',
                        color: AppColors.ciano,
                        onTap: () => Modular.to.pushReplacementNamed(AppRoutes.home),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
