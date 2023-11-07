import 'package:flutter/material.dart';
import 'package:frontend/common_widgets/button_back.dart';
import 'package:frontend/common_widgets/button_blue.dart';
import 'package:frontend/core/common_method.dart';
import 'package:frontend/core/styles/colors.dart';
import 'package:frontend/core/styles/styles.dart';

class LoginScreenWeb extends StatelessWidget {
  const LoginScreenWeb(
      {required this.emailController,
      required this.passwordController,
      required this.onLoginClick,
      required this.onForgotPasswordClick,
      required this.onSignUpClick,
      super.key});

  final TextEditingController emailController;
  final TextEditingController passwordController;
  final VoidCallback onLoginClick;
  final VoidCallback onForgotPasswordClick;
  final VoidCallback onSignUpClick;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GymismoColors.backgroundColor,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Container(
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.all(Radius.circular(8)),
              ),
              padding: const EdgeInsets.only(left: 30, right: 30, bottom: 20),
              width: CommonMethod.isDesktop(context)
                  ? MediaQuery.of(context).size.width / 3
                  : MediaQuery.of(context).size.width / 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  GymismoStyles.h24,
                  const ButtonBack(),
                  GymismoStyles.h24,
                  Container(
                    alignment: Alignment.center,
                    width: 400,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'EMAIL LOG IN',
                          style: GymismoStyles.tsWhiteBlinker12,
                        ),
                        GymismoStyles.h5,
                        const Text(
                          'Login for Gymismo',
                          style: GymismoStyles.tsWhiteBlinker26w600,
                        ),
                        GymismoStyles.h32,
                        AutofillGroup(
                          child: Column(
                            children: [
                              const Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'Email',
                                  style: GymismoStyles.tsFaintBlinker12w400,
                                ),
                              ),
                              GymismoStyles.h5,
                              Theme(
                                data: ThemeData(
                                  textSelectionTheme: TextSelectionThemeData(
                                    cursorColor: GymismoColors.white,
                                    selectionColor: GymismoColors.lightSkyBlue.withOpacity(0.4),
                                    selectionHandleColor: GymismoColors.lightSkyBlue,
                                  ),
                                ),
                                child: TextField(
                                  controller: emailController,
                                  cursorColor: Colors.white,
                                  keyboardType: TextInputType.emailAddress,
                                  autofillHints: const [AutofillHints.email],
                                  style: GymismoStyles.tsWhiteBlinker14,
                                  decoration: InputDecoration(
                                    hintText: 'Enter email',
                                    hintStyle: GymismoStyles.tsWhiteBlinker12,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      borderSide: BorderSide.none,
                                    ),
                                    focusedBorder: const OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: GymismoColors.cerulean,
                                      ),
                                    ),
                                    filled: true,
                                    contentPadding: const EdgeInsets.all(16),
                                    fillColor: GymismoColors.mineshaft,
                                  ),
                                ),
                              ),
                              GymismoStyles.h16,
                              const Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'Password',
                                  style: GymismoStyles.tsFaintBlinker12w400,
                                ),
                              ),
                              GymismoStyles.h5,
                              Theme(
                                data: ThemeData(
                                  textSelectionTheme: TextSelectionThemeData(
                                    cursorColor: GymismoColors.white,
                                    selectionColor: GymismoColors.lightSkyBlue.withOpacity(0.4),
                                    selectionHandleColor: GymismoColors.lightSkyBlue,
                                  ),
                                ),
                                child: TextField(
                                  obscureText: true,
                                  controller: passwordController,
                                  keyboardType: TextInputType.text,
                                  cursorColor: Colors.white,
                                  autofillHints: const [AutofillHints.password],
                                  style: GymismoStyles.tsWhiteBlinker14,
                                  decoration: InputDecoration(
                                    hintText: 'Enter password',
                                    hintStyle: GymismoStyles.tsWhiteBlinker12,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      borderSide: BorderSide.none,
                                    ),
                                    focusedBorder: const OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: GymismoColors.cerulean,
                                      ),
                                    ),
                                    filled: true,
                                    contentPadding: const EdgeInsets.all(16),
                                    fillColor: GymismoColors.mineshaft,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        GymismoStyles.h32,
                        const Text(
                          'By continuing you indicate that you agree to Gymismo’s Terms of Service and Privacy Policy',
                          style: GymismoStyles.tsFaintBlinker12,
                          textAlign: TextAlign.start,
                        ),
                        GymismoStyles.h32,
                        ButtonBlue(
                          onClick: onLoginClick,
                          text: 'SIGN IN WITH EMAIL',
                          width: (MediaQuery.of(context).size.width -
                                  (GymismoStyles.spacingMedium * 3)) /
                              2,
                          color: GymismoColors.textFieldFocusBorder.withOpacity(0.5),
                        ),
                        GymismoStyles.h24,
                        //Forgot button
                        Center(
                          child: InkWell(
                            onTap: onForgotPasswordClick,
                            child: const Padding(
                              padding: EdgeInsets.all(5),
                              child: Text(
                                'FORGOT PASSWORD',
                                style: GymismoStyles.tsFaintBlinker14w400,
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                        GymismoStyles.h8,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'Don\'t have an account?',
                              style: GymismoStyles.tsFaintBlinker12,
                            ),
                            InkWell(
                              onTap: onSignUpClick,
                              child: const Padding(
                                padding: EdgeInsets.all(5),
                                child: Text(
                                  'SIGN UP ',
                                  style: GymismoStyles.tsTextFieldFocusBorderBlinker14w400,
                                  textAlign: TextAlign.start,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
