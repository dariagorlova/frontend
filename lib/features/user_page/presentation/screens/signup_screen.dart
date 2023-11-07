import 'package:flutter/material.dart';
import 'package:frontend/common_widgets/button_back.dart';
import 'package:frontend/common_widgets/button_blue.dart';
import 'package:frontend/common_widgets/do_not_have_an_account.dart';
import 'package:frontend/core/common_method.dart';
import 'package:frontend/core/styles/colors.dart';
import 'package:frontend/core/styles/styles.dart';
import 'package:frontend/features/user_page/presentation/screens/widgets/text_fields_column.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen(
      {required this.controllerEmail,
      required this.controllerPassword,
      required this.controllerName,
      required this.controllerLastName,
      required this.controllerRefCode,
      required this.signUpAction,
      required this.loginScreenOpen,
      super.key});

  final TextEditingController controllerEmail;
  final TextEditingController controllerPassword;
  final TextEditingController controllerName;
  final TextEditingController controllerLastName;
  final TextEditingController controllerRefCode;
  final VoidCallback signUpAction;
  final VoidCallback loginScreenOpen;

  @override
  Widget build(BuildContext context) {
    CommonMethod.statusBarViewTheme();
    return Scaffold(
      backgroundColor: GymismoColors.backgroundColor,
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: ColoredBox(
                color: GymismoColors.backgroundColor,
                child: Container(
                  color: GymismoColors.backgroundColor,
                  padding: const EdgeInsets.symmetric(
                    horizontal: GymismoStyles.spacingSmall,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const ButtonBack(),
                      GymismoStyles.h24,
                      const Text(
                        'SIGN UP ',
                        style: GymismoStyles.tsWhiteBlinker12w600,
                        textAlign: TextAlign.start,
                      ),
                      GymismoStyles.h16,
                      const Text(
                        'Sign up for Gymismo',
                        style: GymismoStyles.tsWhiteBlinker26w600,
                        textAlign: TextAlign.start,
                      ),
                      GymismoStyles.h24,
                      // text fields
                      TextFieldsColumn(
                        controllerName: controllerName,
                        controllerLastName: controllerLastName,
                        controllerEmail: controllerEmail,
                        controllerPassword: controllerPassword,
                        controllerRefCode: controllerRefCode,
                      ),
                      GymismoStyles.h24,
                      const Text(
                        'By continuing you indicate that you agree to Gymismo’s Terms of Service and Privacy Policy',
                        style: GymismoStyles.tsFaintBlinker12,
                        textAlign: TextAlign.start,
                      ),
                      GymismoStyles.h50,
                    ],
                  ),
                ),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: GymismoStyles.spacingSmall,
            ),
            child: Column(
              children: [
                GymismoStyles.h16,
                Center(
                  child: ButtonBlue(
                    text: ' SIGN UP WITH EMAIL',
                    width: double.infinity,
                    onClick: signUpAction,
                  ),
                ),
                DoNotHaveAnAccount(
                  isLogin: false,
                  onClick: loginScreenOpen,
                ),
                GymismoStyles.h50,
              ],
            ),
          ),
        ],
      ),
    );
  }
}
