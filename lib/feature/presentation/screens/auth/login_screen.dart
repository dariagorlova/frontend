import 'dart:math';

import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome_icons.dart';
import 'package:frontend/feature/presentation/widgets/page_layout_helpers.dart';
import 'package:frontend/feature/presentation/widgets/rectangle_button.dart';
import 'package:frontend/feature/presentation/widgets/text_field_widget.dart';
import 'package:frontend/mobile_navigation.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({
    required this.controllerEmail,
    required this.controllerPassword,
    this.loginAction,
    this.forgotPasswordScreenOpen,
    this.signUpScreenOpen,
    super.key,
  });

  final TextEditingController controllerEmail;
  final TextEditingController controllerPassword;
  final VoidCallback? loginAction;
  final VoidCallback? forgotPasswordScreenOpen;
  final VoidCallback? signUpScreenOpen;

  @override
  Widget build(BuildContext context) {
    final buttonWidth = min<double>(MediaQuery.of(context).size.width * 0.8, 400);
    const topPanelHeight = 24;

    return Scaffold(
      body: GestureDetector(
        onTap: FocusScope.of(context).unfocus,
        child: SingleChildScrollView(
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height - topPanelHeight,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: MobileNavigationActions.instance.backToPreviousPage,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 50),
                  child: Text(
                    'Login',
                    style: TextStyle(fontSize: 36),
                  ),
                ),
                const Spacer(),
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ScreenHelper.h32,
                      TextFieldWidget(
                        controller: controllerEmail,
                        labelText: 'Email',
                        hintText: 'your@email.com',
                        isEmail: true,
                        icon: FontAwesome.mail,
                        width: buttonWidth,
                      ),
                      ScreenHelper.h32,
                      TextFieldWidget(
                        controller: controllerPassword,
                        icon: FontAwesome.lock,
                        labelText: 'Password',
                        hintText: '********',
                        isPassword: true,
                        width: buttonWidth,
                      ),
                      ScreenHelper.h40,
                      RectangleButton(text: 'LOGIN', onClick: loginAction, width: buttonWidth),
                      ScreenHelper.h40,
                      GestureDetector(
                        onTap: () {
                          MobileNavigationActions.instance.backToPreviousPage();
                          forgotPasswordScreenOpen?.call();
                        },
                        child: const Text(
                          'Forgot your password?',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      ScreenHelper.h40,
                    ],
                  ),
                ),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Don\'t have an account? ',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        MobileNavigationActions.instance.backToPreviousPage();
                        signUpScreenOpen?.call();
                      },
                      child: const Text(
                        'Sign Up',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                ScreenHelper.h50,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
