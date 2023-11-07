import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/common_widgets/authorization_option_buttons.dart';
import 'package:frontend/common_widgets/do_not_have_an_account_with_or.dart';
import 'package:frontend/common_widgets/term_and_condition_widget.dart';
import 'package:frontend/core/navigation/navigations_keys.dart';
import 'package:frontend/core/styles/colors.dart';
import 'package:frontend/core/styles/styles.dart';
import 'package:frontend/core/utils/utils.dart';
import 'package:frontend/features/main_tab/presentation/screen_web/main_tab_screen_web.dart';
import 'package:frontend/features/user_page/presentation/bloc/user_cubit.dart';
import 'package:frontend/features/user_page/presentation/screens_web/login_screen.dart';
import 'package:frontend/features/user_page/presentation/screens_web/signup_screen.dart';
import 'package:go_router/go_router.dart';

class AuthScreenWeb extends StatefulWidget {
  static const String route = NavigationRouteNames.authScreenWeb;
  const AuthScreenWeb({super.key});

  @override
  State<AuthScreenWeb> createState() => _AuthScreenWebState();
}

class _AuthScreenWebState extends State<AuthScreenWeb> with TickerProviderStateMixin {
  AnimationController? controllerAnimation;
  var controllerName = TextEditingController();
  var controllerLastName = TextEditingController();
  var controllerEmail = TextEditingController();
  var controllerPassword = TextEditingController();
  var controllerRefCode = TextEditingController();

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
    controllerLastName.dispose();
    controllerEmail.dispose();
    controllerPassword.dispose();
    controllerRefCode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool isLogin = true;

    return BlocListener<UserCubit, UserState>(
      listener: (context, state) {
        state.maybeWhen(
            error: (message) => Utils.toastMessage(message),
            resendEmailAlert: () {},
            orElse: () {});
      },
      child: Scaffold(
        backgroundColor: GymismoColors.backgroundColor,
        body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            return SafeArea(
              child: Stack(
                children: [
                  const Positioned(
                      right: 20,
                      top: 20,
                      child: Text(
                        'v2.0',
                        style: GymismoStyles.tsWhiteArchivo14,
                      ) //VersionInfoText(),
                      ),
                  Center(
                    child: SingleChildScrollView(
                      child: Container(
                        decoration: const BoxDecoration(
                          color: Colors.black,
                          borderRadius:
                              BorderRadius.all(Radius.circular(GymismoStyles.spacingExtraSmall)),
                        ),
                        padding: const EdgeInsets.only(
                          left: 120,
                          right: 120,
                          bottom: 40,
                          top: 30,
                        ),
                        child: Column(
                          children: <Widget>[
                            GymismoStyles.h8,
                            SizedBox(
                              width: 300,
                              child: Center(
                                child: Image.asset(
                                  'assets/images/logo.png',
                                  height: 50,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 35,
                            ),
                            SizedBox(
                              width: 300,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  AuthorizationOptionsButtons(
                                    appleSignInAction: _appleLoginAction,
                                    facebookSignInAction: _facebookLoginAction,
                                    emailSignInAction: _loginButtonClick,
                                    emailSignUpAction: _signUpButtonClick,
                                    googleSignInAction: _googleLoginAction,
                                    isLogin: isLogin,
                                    buttonsPadding: GymismoStyles.spacingSmall,
                                  ),
                                  GymismoStyles.h16,
                                  DoNotHaveAnAccountWithOr(
                                    isLogin: isLogin,
                                    onLoginModeChange: () {
                                      setState(() {
                                        isLogin = !isLogin;
                                      });
                                    },
                                  ),
                                  GymismoStyles.h32,
                                  const TermsAndConditionWidget(),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  //if (_isLoading) const ShowProgressBar()
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  void _appleLoginAction() {
    //
  }

  void _googleLoginAction() {
    //
  }

  void _facebookLoginAction() {
    //
  }

  /// show the login screen
  void _loginButtonClick() {
    controllerEmail = TextEditingController(
      text: const String.fromEnvironment('DEFAULT_EMAIL_LOGIN'),
    );
    controllerPassword = TextEditingController(
      text: const String.fromEnvironment('DEFAULT_EMAIL_PASSWORD'),
    );

    Utils.slideFromBottom(
      context,
      controller: controllerAnimation,
      page: LoginScreenWeb(
        emailController: controllerEmail,
        passwordController: controllerPassword,
        onLoginClick: _loginAction,
        onForgotPasswordClick: _forgotPasswordClick,
        onSignUpClick: _signUpButtonClick,
      ),
    );
  }

  /// show the signup screen
  void _signUpButtonClick() {
    Utils.slideFromBottom(
      context,
      controller: controllerAnimation,
      page: SignUpScreenWeb(
        controllerEmail: controllerEmail,
        controllerPassword: controllerPassword,
        controllerName: controllerName,
        controllerLastName: controllerLastName,
        controllerRefCode: controllerRefCode,
        signUpAction: _signUpAction,
        loginScreenOpen: _loginButtonClick,
      ),
    );
  }

  /// show the forgot password screen
  void _forgotPasswordClick() {
    context.read<UserCubit>().forgotPassword(controllerEmail.text.trim());
  }

  /// login usecase launch
  void _loginAction() async {
    await context
        .read<UserCubit>()
        .logIn(controllerEmail.text.trim(), controllerPassword.text.trim());
    GoRouter.of(Utils.mainNavigation.currentContext!).go(MainTabScreenWeb.route);
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
      if (mounted) {
        // Utils.slideFromBottom(
        //   context,
        //   controller: controllerAnimation,
        //   page: CheckYourEmailScreenWeb(
        //     email: controllerEmail.text.trim(),
        //     redirectToAuthScreen: () {
        //       GoRouter.of(Utils.mainNavigation.currentContext!).go(AuthScreenWeb.route);
        //     },
        //     resendEmail: () {
        //       context.read<UserCubit>().resendVerificationEmail(controllerEmail.text.trim());
        //     },
        //   ),
        // );
      }
    }
  }
}
