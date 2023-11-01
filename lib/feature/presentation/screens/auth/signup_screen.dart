import 'dart:math';

import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome_icons.dart';
import 'package:frontend/feature/presentation/widgets/rectangle_button.dart';
import 'package:frontend/feature/presentation/widgets/text_field_widget.dart';
import 'package:frontend/mobile_navigation.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen(
      {required this.controllerEmail,
      required this.controllerPassword,
      required this.controllerName,
      required this.controllerRefCode,
      this.signUpAction,
      this.loginScreenOpen,
      super.key});

  final TextEditingController controllerEmail;
  final TextEditingController controllerPassword;
  final TextEditingController controllerName;
  final TextEditingController controllerRefCode;
  final VoidCallback? signUpAction;
  final VoidCallback? loginScreenOpen;

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
                    'Personal details',
                    style: TextStyle(fontSize: 36),
                  ),
                ),
                const Spacer(),
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const SizedBox(height: 32),
                      TextFieldWidget(
                        controller: controllerEmail,
                        labelText: 'Email',
                        hintText: 'your@email.com',
                        isEmail: true,
                        icon: FontAwesome.mail,
                        width: buttonWidth,
                      ),
                      const SizedBox(height: 32),
                      TextFieldWidget(
                        controller: controllerPassword,
                        icon: FontAwesome.lock,
                        labelText: 'Password',
                        hintText: '********',
                        isPassword: true,
                        width: buttonWidth,
                      ),
                      const SizedBox(height: 32),
                      TextFieldWidget(
                        controller: controllerName,
                        labelText: 'User name',
                        hintText: 'Introduce yourself',
                        icon: FontAwesome.user,
                        width: buttonWidth,
                      ),
                      const SizedBox(height: 40),
                      RectangleButton(text: 'SIGN UP', onClick: signUpAction, width: buttonWidth),
                      const SizedBox(height: 40),
                    ],
                  ),
                ),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Already have an account? ',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        MobileNavigationActions.instance.backToPreviousPage();
                        loginScreenOpen?.call();
                      },
                      child: const Text(
                        'Sign in',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 60),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
