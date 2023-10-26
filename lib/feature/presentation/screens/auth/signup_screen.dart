import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttericon/font_awesome_icons.dart';
import 'package:frontend/feature/presentation/bloc/auth/auth_cubit.dart';
import 'package:frontend/feature/presentation/widgets/error_toast.dart';
import 'package:frontend/feature/presentation/widgets/text_field_widget.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final controllerEmail = TextEditingController();
  final controllerPassword = TextEditingController();
  final controllerName = TextEditingController();
  final controllerRefCode = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    controllerEmail.dispose();
    controllerPassword.dispose();
    controllerName.dispose();
    controllerRefCode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final buttonWidth = min<double>(MediaQuery.of(context).size.width * 0.8, 400);

    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        state.maybeWhen(
          error: (message) => ScaffoldMessenger.of(context).showSnackBar(
            errorToasts(message: message),
          ),
          showEmailNeedVerifyScreen: () {
            final alertDialog = CupertinoAlertDialog(
              title: const Text("Email verification"),
              content: const Text(
                  "Please confirm your email. To resend an verification email click the corresponding button"),
              actions: [
                CupertinoButton(
                    child: const Text('Resend'),
                    onPressed: () {
                      context.read<AuthCubit>().verifyEmail(controllerEmail.text.trim());
                      Navigator.of(context).pop();
                    }),
                CupertinoButton(
                  child: const Text('Ok'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                )
              ],
            );
            showDialog(
              barrierDismissible: false,
              builder: (ctx) {
                return alertDialog;
              },
              context: context,
            );
          },
          orElse: () {},
        );
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Sign Up'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFieldWidget(
                controller: controllerName,
                labelText: 'User name',
                hintText: 'Introduce yourself',
                icon: FontAwesome.user,
                width: buttonWidth,
              ),
              const SizedBox(
                height: 32,
              ),
              TextFieldWidget(
                controller: controllerEmail,
                labelText: 'Email',
                hintText: 'your@email.com',
                isEmail: true,
                icon: FontAwesome.mail,
                width: buttonWidth,
              ),
              const SizedBox(
                height: 32,
              ),
              TextFieldWidget(
                controller: controllerPassword,
                icon: FontAwesome.lock,
                labelText: 'Password',
                hintText: '********',
                isPassword: true,
                width: buttonWidth,
              ),
              const SizedBox(
                height: 32,
              ),
              TextFieldWidget(
                controller: controllerRefCode,
                labelText: 'Referal code',
                hintText: 'Enter referal code',
                icon: FontAwesome.users,
                width: buttonWidth,
              ),
              const SizedBox(height: 40),
              ElevatedButton(
                onPressed: _signupAction,
                child: const Text('SIGN UP'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _signupAction() {
    context.read<AuthCubit>().signUp(
          controllerEmail.text.trim(),
          controllerPassword.text.trim(),
          controllerName.text.trim(),
        );
  }
}
