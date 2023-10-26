import 'dart:math';

import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome_icons.dart';
import 'package:frontend/feature/presentation/screens/auth/auth_screen.dart';
import 'package:frontend/feature/presentation/widgets/text_field_widget.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen(
      {required this.name,
      required this.email,
      required this.password,
      required this.referalCode,
      super.key});

  final String name;
  final String password;
  final String email;
  final String referalCode;

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final controllerEmail = TextEditingController();
  final controllerPassword = TextEditingController();
  final controllerName = TextEditingController();
  final controllerRefCode = TextEditingController();

  @override
  void initState() {
    super.initState();
    controllerName.text = widget.name;
    controllerPassword.text = widget.password;
    controllerEmail.text = widget.email;
    controllerRefCode.text = widget.referalCode;
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

    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
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
              onPressed: _updateAction,
              child: const Text('UPDATE'),
            ),
            ElevatedButton(
              onPressed: _logoutAction,
              child: const Text('LOG OUT'),
            ),
            ElevatedButton(
              onPressed: _deleteUserAction,
              child: const Text('DELETE ACCOUNT'),
            ),
          ],
        ),
      ),
    );
  }

  void _updateAction() {
    // context.read<auth.AuthCubit>().signUp(
    //   controllerEmail.text.trim(),
    //   controllerPassword.text.trim(),
    //   controllerName.text.trim(),
    // );
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (BuildContext ctx) => const AuthScreen(),
      ),
    );
  }

  void _logoutAction() {
    //
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (BuildContext ctx) => const AuthScreen(),
      ),
    );
  }

  void _deleteUserAction() {
    //
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (BuildContext ctx) => const AuthScreen(),
      ),
    );
  }
}
