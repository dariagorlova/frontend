import 'package:flutter/material.dart';

class SignUpScreenWeb extends StatelessWidget {
  const SignUpScreenWeb(
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
    return const Placeholder();
  }
}
