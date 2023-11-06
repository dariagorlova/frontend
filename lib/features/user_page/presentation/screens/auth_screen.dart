import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/common_widgets/authorization_option_buttons.dart';
import 'package:frontend/common_widgets/do_not_have_an_account.dart';
import 'package:frontend/common_widgets/term_and_condition_widget.dart';
import 'package:frontend/core/common_method.dart';
import 'package:frontend/core/styles/colors.dart';
import 'package:frontend/core/styles/images.dart';
import 'package:frontend/core/styles/styles.dart';
import 'package:frontend/core/utils/utils.dart';
import 'package:frontend/features/main_page/presentation/screen/main_page.dart';
import 'package:frontend/features/user_page/presentation/bloc/user_cubit.dart';
import 'package:frontend/features/user_page/presentation/screens/login_screen.dart';
import 'package:frontend/features/user_page/presentation/screens/signup_screen.dart';
import 'package:go_router/go_router.dart';

class AuthScreen extends StatefulWidget {
  static const String route = '/auth';
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> with TickerProviderStateMixin {
  AnimationController? controllerAnimation;
  var controllerName = TextEditingController();
  var controllerEmail = TextEditingController();
  var controllerPassword = TextEditingController();
  var controllerRefCode = TextEditingController();
  bool _isLogin = true;

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
    return BlocListener<UserCubit, UserState>(
      listenWhen: (previous, current) {
        previous.maybeWhen(
          loadingWithProgress: () => context.pop(),
          orElse: () {},
        );
        return previous != current;
      },
      listener: (context, state) {
        state.maybeWhen(
          error: (message) => Utils.toastMessage(message),
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
        backgroundColor: GymismoColors.backgroundColor,
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            image: const DecorationImage(
              image: AssetImage(GymismoImages.background),
              fit: BoxFit.cover,
            ),
            gradient: LinearGradient(
              colors: [
                GymismoColors.linearGradient.withOpacity(0.40),
                GymismoColors.linearGradient.withOpacity(0.97),
                GymismoColors.linearGradient.withOpacity(0.97),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  image: const DecorationImage(
                    image: AssetImage(GymismoImages.backgroundGradient),
                    fit: BoxFit.cover,
                  ),
                  gradient: LinearGradient(
                    begin: FractionalOffset.topCenter,
                    end: FractionalOffset.bottomCenter,
                    colors: [
                      GymismoColors.linearGradient.withOpacity(0.7),
                      GymismoColors.linearGradient.withOpacity(0.1),
                      GymismoColors.linearGradient.withOpacity(0.7),
                      GymismoColors.linearGradient.withOpacity(0.8),
                      GymismoColors.linearGradient.withOpacity(1.0),
                    ],
                    stops: const [0.1, 0.2, 0.4, 0.6, 1.0],
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topCenter,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 30,
                  ),
                  child: Column(
                    children: [
                      CommonMethod.instance.isNotchDevice(context)
                          ? GymismoStyles.h68
                          : GymismoStyles.h24,
                      Image.asset(
                        GymismoImages.logo,
                        fit: BoxFit.cover,
                        width: 150,
                      ),
                      const Spacer(),
                      AuthorizationOptionsButtons(
                        appleSignInAction: _appleLoginAction,
                        facebookSignInAction: _facebookLoginAction,
                        emailSignInAction: _loginButtonClick,
                        emailSignUpAction: _signUpButtonClick,
                        googleSignInAction: _googleLoginAction,
                        isLogin: _isLogin,
                        buttonsPadding: GymismoStyles.spacingSmall,
                      ),
                      GymismoStyles.h16,
                      DoNotHaveAnAccount(
                        isLogin: _isLogin,
                        onLoginModeChange: () {
                          setState(() {
                            _isLogin = !_isLogin;
                          });
                        },
                      ),
                      GymismoStyles.h32,
                      const TermsAndConditionWidget(),
                      CommonMethod.instance.isNotchDevice(context)
                          ? GymismoStyles.h24
                          : GymismoStyles.h8,
                    ],
                  ),
                ),
              ),
            ],
          ),
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
      page: LoginScreen(
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
      page: SignUpScreen(
        controllerEmail: controllerEmail,
        controllerPassword: controllerPassword,
        controllerName: controllerName,
        signUpAction: _signUpAction,
        loginScreenOpen: _loginButtonClick,
        controllerRefCode: controllerRefCode,
      ),
    );
  }

  /// show the forgot password screen
  void _forgotPasswordClick() {
    context.read<UserCubit>().forgotPassword(controllerEmail.text.trim());

    // Utils.slideFromBottom(
    //   context,
    //   controller: controllerAnimation,
    //   page: ForgotPasswordScreen(
    //       controllerEmail: controllerEmail,
    //       forgotPasswordAction: _forgotPasswordAction,
    //     ),
    // );

    //  Navigator.push(
    //                             context,
    //                             MaterialPageRoute<void>(
    //                               builder: (context) => const ForgotPasswordFirstScreen(), //
    //                             ),
    //                           );
  }

  /// login usecase launch
  void _loginAction() async {
    await context
        .read<UserCubit>()
        .logIn(controllerEmail.text.trim(), controllerPassword.text.trim());
    GoRouter.of(Utils.mainNavigation.currentContext!).go(MainPage.route);
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
      //MobileNavigationActions.instance.showCheckYourEmailScreen(email: controllerEmail.text.trim());
    }
  }
}
