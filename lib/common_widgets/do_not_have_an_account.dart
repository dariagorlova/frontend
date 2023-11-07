import 'package:flutter/material.dart';
import 'package:frontend/core/styles/styles.dart';

class DoNotHaveAnAccount extends StatelessWidget {
  const DoNotHaveAnAccount({required this.isLogin, required this.onClick, super.key});

  final bool isLogin;
  final VoidCallback onClick;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          !isLogin ? 'Already have an account?' : 'Don\'t have an account?',
          style: GymismoStyles.tsWhiteBlinker14,
          textAlign: TextAlign.start,
        ),
        InkWell(
          onTap: onClick,
          child: Padding(
            padding: const EdgeInsets.only(left: GymismoStyles.spacingExtraSmall),
            child: Text(
              !isLogin ? 'Login' : 'Signup',
              style: GymismoStyles.tsWhiteBlinker14w400,
              textAlign: TextAlign.start,
            ),
          ),
        ),
      ],
    );
  }
}
