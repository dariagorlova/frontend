import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/core/constants.dart';
import 'package:frontend/feature/presentation/bloc/user/user_cubit.dart';
import 'package:frontend/feature/presentation/screens/auth/login_screen.dart';
import 'package:frontend/feature/presentation/screens/auth/signup_screen.dart';
import 'package:frontend/feature/presentation/widgets/error_toast.dart';
import 'package:frontend/feature/presentation/widgets/page_layout_helpers.dart';
import 'package:frontend/feature/presentation/widgets/rectangle_button.dart';
import 'package:frontend/mobile_navigation.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> with TickerProviderStateMixin {
  AnimationController? controllerAnimation;
  final controllerName = TextEditingController();
  final controllerEmail = TextEditingController();
  final controllerPassword = TextEditingController();
  final controllerRefCode = TextEditingController();

  @override
  void initState() {
    super.initState();
    controllerAnimation = BottomSheet.createAnimationController(this);
    controllerAnimation?.duration = const Duration(milliseconds: 600);
    controllerAnimation?.reverseDuration = const Duration(milliseconds: 600);
  }

  @override
  void dispose() {
    controllerAnimation?.dispose();
    controllerName.dispose();
    controllerEmail.dispose();
    controllerPassword.dispose();
    controllerRefCode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = min<double>(MediaQuery.of(context).size.width * 0.8, 400);

    return BlocListener<UserCubit, UserState>(
      listenWhen: (previous, current) {
        previous.maybeWhen(
          loadingWithProgress: () => MobileNavigationActions.instance.backToPreviousPage(),
          orElse: () {},
        );
        return previous != current;
      },
      listener: (context, state) {
        state.maybeWhen(
          error: (message) => ScaffoldMessenger.of(context).showSnackBar(
            errorToasts(message: message),
          ),
          resendEmailAlert: () {
            final alertDialog = CupertinoAlertDialog(
              title: const Text("Email verification"),
              content: const Text(
                  "Please confirm your email first. To resend an verification email click the corresponding button"),
              actions: [
                CupertinoButton(
                    child: const Text('Resend'),
                    onPressed: () {
                      context
                          .read<UserCubit>()
                          .resendVerificationEmail(controllerEmail.text.trim());
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
          orElse: () {},
        );
      },
      child: Scaffold(
        body: Center(
          child: Column(
            children: [
              const Spacer(),
              Center(
                child: RectangleButton(
                  text: 'Sign Up',
                  onClick: _signUpButtonClick,
                  bgColor: accentRectangleButtonColor,
                  textColor: accentRectangleButtonTextColor,
                  width: width,
                ),
              ),
              ScreenHelper.h8,
              Center(
                  child: RectangleButton(text: 'Login', onClick: _loginButtonClick, width: width)),
              ScreenHelper.h32,
            ],
          ),
        ),
      ),
    );
  }

  /// show the login screen
  void _loginButtonClick() {
    showModalBottomSheet<void>(
      barrierColor: Colors.transparent,
      context: context,
      useSafeArea: true,
      isDismissible: false,
      isScrollControlled: true,
      transitionAnimationController: controllerAnimation,
      builder: (BuildContext context) {
        return LoginScreen(
          controllerEmail: controllerEmail,
          controllerPassword: controllerPassword,
          loginAction: _loginAction,
          forgotPasswordScreenOpen: _forgotPasswordClick,
          signUpScreenOpen: _signUpButtonClick,
        );
      },
    );
  }

  /// show the signup screen
  void _signUpButtonClick() {
    showModalBottomSheet<void>(
      barrierColor: Colors.transparent,
      context: context,
      useSafeArea: true,
      isDismissible: false,
      isScrollControlled: true,
      transitionAnimationController: controllerAnimation,
      builder: (BuildContext context) {
        return SignUpScreen(
          controllerEmail: controllerEmail,
          controllerPassword: controllerPassword,
          controllerName: controllerName,
          signUpAction: _signUpAction,
          loginScreenOpen: _loginButtonClick,
          controllerRefCode: controllerRefCode,
        );
      },
    );
  }

  /// show the forgot password screen
  void _forgotPasswordClick() {
    // showModalBottomSheet<void>(
    //   context: context,
    //   useSafeArea: true,
    //   isDismissible: false,
    //   isScrollControlled: true,
    //   transitionAnimationController: controllerAnimation,
    //   builder: (BuildContext context) {
    //     return ForgotPasswordScreen(
    //       controllerEmail: controllerEmail,
    //       forgotPasswordAction: _forgotPasswordAction,
    //     );
    //   },
    // );
  }

  /// login usecase launch
  void _loginAction() {
    context.read<UserCubit>().logIn(controllerEmail.text.trim(), controllerPassword.text.trim());
  }

  /// new user creation usecase launch
  Future<void> _signUpAction() async {
    final result = await context.read<UserCubit>().signUp(
          controllerEmail.text.trim(),
          controllerPassword.text.trim(),
          controllerName.text.trim(),
        );
    if (result) {
      // move to nice screen, that will tell us about sent verification email
      MobileNavigationActions.instance.showCheckYourEmailScreen(email: controllerEmail.text.trim());
    }
  }

  /// restore password usecase launch
  void _forgotPasswordAction() =>
      context.read<UserCubit>().forgotPassword(controllerEmail.text.trim());
}
