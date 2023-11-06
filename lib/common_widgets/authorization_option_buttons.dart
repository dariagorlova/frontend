import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:frontend/common_widgets/square_button.dart';
import 'package:frontend/core/styles/images.dart';

class AuthorizationOptionsButtons extends StatelessWidget {
  const AuthorizationOptionsButtons({
    required this.appleSignInAction,
    required this.facebookSignInAction,
    required this.emailSignInAction,
    required this.emailSignUpAction,
    required this.googleSignInAction,
    required this.isLogin,
    this.buttonsPadding = 0,
    super.key,
  });

  final VoidCallback appleSignInAction;
  final VoidCallback googleSignInAction;
  final VoidCallback facebookSignInAction;
  final VoidCallback emailSignInAction;
  final VoidCallback emailSignUpAction;
  final double buttonsPadding;
  final bool isLogin;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (kIsWeb || Platform.isIOS)
          SquareButton(
            path: GymismoImages.icApple,
            text: isLogin ? 'SIGN IN WITH APPLE ' : 'SIGN UP WITH APPLE ',
            fun: appleSignInAction,
          ),
        Padding(
          padding: EdgeInsets.only(top: buttonsPadding),
          child: SquareButton(
            path: GymismoImages.icGoogle,
            text: isLogin ? 'SIGN IN WITH GOOGLE ' : 'SIGN UP WITH GOOGLE ',
            fun: googleSignInAction,
          ),
        ),
        //if (RemoteConfigHelper.instance.isFacebookActive)
        // Padding(
        //   padding: EdgeInsets.only(top: widget.buttonsPadding),
        //   child: SquareButton(
        //     path: GymismoImages.icFacebook,
        //     text: widget.isLogin ? 'SIGN IN WITH FACEBOOK ' : 'SIGN UP WITH FACEBOOK ',
        //     fun: widget.facebookSignInAction,
        //   ),
        // ),
        Padding(
          padding: EdgeInsets.only(top: buttonsPadding),
          child: SquareButton(
            path: GymismoImages.icMail,
            text: isLogin ? 'SIGN IN WITH EMAIL ' : 'SIGN UP WITH EMAIL ',
            fun: isLogin ? emailSignInAction : emailSignUpAction,
          ),
        ),
      ],
    );
  }
}
