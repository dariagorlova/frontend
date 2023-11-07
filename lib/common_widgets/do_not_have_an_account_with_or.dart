import 'package:flutter/material.dart';
import 'package:frontend/core/styles/colors.dart';
import 'package:frontend/core/styles/styles.dart';

class DoNotHaveAnAccountWithOr extends StatelessWidget {
  const DoNotHaveAnAccountWithOr({
    required this.onLoginModeChange,
    required this.isLogin,
    super.key,
  });
  final VoidCallback onLoginModeChange;
  final bool isLogin;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Row(
          children: [
            Expanded(
              child: Divider(
                color: GymismoColors.faint,
                thickness: 2,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 15, right: 15),
              child: Text(
                'OR',
                style: GymismoStyles.tsWhiteArchivo14,
              ),
            ),
            Expanded(
              child: Divider(
                color: GymismoColors.faint,
                thickness: 2,
              ),
            ),
          ],
        ),
        GymismoStyles.h16,
        Text(
          isLogin ? 'Don\'t have an account?' : 'Already have an account?',
          style: GymismoStyles.tsGainsArchivo12,
        ),
        Padding(
          padding: const EdgeInsets.all(5),
          child: InkWell(
            mouseCursor: SystemMouseCursors.click,
            onTap: onLoginModeChange,
            child: Text(
              isLogin ? 'SIGN UP ' : 'LOG IN',
              style: GymismoStyles.tsTextFieldBorderArchivo12,
            ),
          ),
        ),
      ],
    );
  }
}
