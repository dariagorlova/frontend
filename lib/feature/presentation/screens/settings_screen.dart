import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttericon/font_awesome_icons.dart';
import 'package:frontend/core/constants.dart';
import 'package:frontend/feature/presentation/bloc/user/user_cubit.dart';
import 'package:frontend/feature/presentation/widgets/page_layout_helpers.dart';
import 'package:frontend/feature/presentation/widgets/rectangle_button.dart';
import 'package:frontend/feature/presentation/widgets/text_field_widget.dart';
import 'package:shared_models/shared_models.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final controllerEmail = TextEditingController();
  final controllerPassword = TextEditingController();
  final controllerName = TextEditingController();
  final controllerRefCode = TextEditingController();
  final user = User.empty();

  @override
  void initState() {
    super.initState();
    controllerName.text = user.userName;
    controllerPassword.text = user.password ?? '';
    controllerEmail.text = user.email;
    controllerRefCode.text = user.referalCode ?? '';
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
            ScreenHelper.h32,
            TextFieldWidget(
              controller: controllerRefCode,
              labelText: 'Referal code',
              hintText: 'Enter referal code',
              icon: FontAwesome.users,
              width: buttonWidth,
            ),
            ScreenHelper.h40,
            RectangleButton(
                onClick: _updateAction,
                width: 150,
                text: 'UPDATE',
                //icon: FontAwesome.logout,
                bgColor: defaultRectangleButtonColor,
                textColor: defaultRectangleButtonTextColor,
                fontSize: 12),
            ScreenHelper.h8,
            RectangleButton(
                onClick: _logoutAction,
                width: 150,
                text: 'LOGOUT',
                //icon: FontAwesome.logout,
                bgColor: defaultRectangleButtonColor,
                textColor: defaultRectangleButtonTextColor,
                fontSize: 12),
            ScreenHelper.h8,
            RectangleButton(
                onClick: _deleteUserAction,
                width: 150,
                text: 'DELETE ACCOUNT',
                //icon: FontAwesome.logout,
                bgColor: defaultRectangleButtonColor,
                textColor: defaultRectangleButtonTextColor,
                fontSize: 12),
          ],
        ),
      ),
    );
  }

  void _updateAction() => context.read<UserCubit>().changeName(controllerName.text.trim());
  void _logoutAction() => context.read<UserCubit>().logOut();
  void _deleteUserAction() => context.read<UserCubit>().deleteAccount();
}
