import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttericon/font_awesome_icons.dart';
import 'package:frontend/feature/presentation/bloc/auth/auth_cubit.dart';
import 'package:frontend/feature/presentation/screens/auth/auth_screen.dart';
import 'package:frontend/feature/presentation/screens/main_tab_screen.dart';
import 'package:frontend/feature/presentation/widgets/error_toast.dart';
import 'package:frontend/feature/presentation/widgets/text_field_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final controllerEmail = TextEditingController();
  final controllerPassword = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    controllerEmail.dispose();
    controllerPassword.dispose();
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
            showResentEmailPopup: () {
              final alertDialog = CupertinoAlertDialog(
                title: const Text("Email verification"),
                content: const Text(
                    "Please confirm your email first. To resend an verification email click the corresponding button"),
                actions: [
                  CupertinoButton(
                      child: const Text('Resend'),
                      onPressed: () {
                        // TODO: verifyEmail
                        context.read<AuthCubit>().verifyEmail(controllerEmail.text.trim());
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (BuildContext ctx) => const AuthScreen(),
                          ),
                        );
                      }),
                  CupertinoButton(
                    child: const Text('Ok'),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext ctx) => const AuthScreen(),
                        ),
                      );
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
            success: (user) {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (BuildContext ctx) => MainTabScreen(
                    name: user.userName,
                    password: user.password ?? '',
                    email: user.email,
                    referalCode: user.referalCode ?? '',
                  ),
                ),
              );
            },
            orElse: () {});
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Login'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
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
              const SizedBox(height: 40),
              ElevatedButton(
                onPressed: _loginAction,
                child: const Text('LOGIN'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _loginAction() {
    context.read<AuthCubit>().logIn(
          controllerEmail.text.trim(),
          controllerPassword.text.trim(),
        );
  }
}
