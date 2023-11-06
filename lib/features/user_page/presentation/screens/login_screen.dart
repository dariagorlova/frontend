import 'package:flutter/material.dart';
import 'package:frontend/common_widgets/button_blue.dart';
import 'package:frontend/common_widgets/text_field_widget.dart';
import 'package:frontend/core/common_method.dart';
import 'package:frontend/core/styles/colors.dart';
import 'package:frontend/core/styles/styles.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({
    required this.emailController,
    required this.passwordController,
    required this.onLoginClick,
    required this.onForgotPasswordClick,
    required this.onSignUpClick,
    super.key,
  });

  final TextEditingController emailController;
  final TextEditingController passwordController;
  final VoidCallback onLoginClick;
  final VoidCallback onForgotPasswordClick;
  final VoidCallback onSignUpClick;

  @override
  Widget build(BuildContext context) {
    //show status bar view color
    CommonMethod.statusBarViewTheme();

    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: GymismoColors.backgroundColor,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Stack(
              children: [
                Column(
                  children: [
                    // AppNavigationBar
                    Container(
                      height: 40,
                      width: MediaQuery.of(context).size.width,
                      padding: const EdgeInsets.symmetric(
                        horizontal: GymismoStyles.spacingSmall,
                      ),
                      child: GestureDetector(
                        onTap: () => Navigator.pop(context, 'back'),
                        child: Container(
                          height: 40,
                          width: 40,
                          alignment: Alignment.centerLeft,
                          child: const Icon(
                            Icons.arrow_back_ios_rounded,
                            size: 20,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: GymismoStyles.spacingSmall,
                      ),
                      margin: const EdgeInsets.only(bottom: 40),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          const SizedBox(
                            height: 20,
                          ),
                          const Text(
                            'LOGIN',
                            style: GymismoStyles.tsWhiteBlinker12,
                            textAlign: TextAlign.start,
                          ),
                          const SizedBox(
                            height: GymismoStyles.spacingExtraSmall,
                          ),
                          const Text(
                            'Login with email',
                            style: GymismoStyles.tsWhiteBlinker26,
                            textAlign: TextAlign.start,
                          ),
                          const SizedBox(
                            height: GymismoStyles.spacingMedium,
                          ),
                          const Text(
                            'Your email',
                            style: GymismoStyles.tsFaintBlinker12,
                            textAlign: TextAlign.start,
                          ),
                          GymismoStyles.h8,
                          TextFieldWidget(
                            controller: emailController,
                            hint: 'Enter email',
                            textInputType: TextInputType.emailAddress,
                          ),
                          const SizedBox(
                            height: GymismoStyles.spacingSmall,
                          ),
                          //LabelWidget(text: Language.current.password),
                          const Text(
                            'Password',
                            style: GymismoStyles.tsFaintBlinker12,
                            textAlign: TextAlign.start,
                          ),
                          GymismoStyles.h8,
                          TextFieldWidget(
                            controller: passwordController,
                            hint: 'Enter password',
                            textInputType: TextInputType.text,
                            isPassword: true,
                          ),
                          const SizedBox(
                            height: GymismoStyles.spacingLarge,
                          ),
                          Center(
                            child: ButtonBlue(
                              onClick: onLoginClick,
                              text: 'LOGIN',
                              width: double.infinity,
                            ),
                          ),
                          // LoginButtonWidget(
                          //   onExerciseBlocListenerLogic: (SignInState state) {
                          //     if (state is SignInLoadingState) {
                          //       if (mounted) {
                          //         setState(() {
                          //           _isLoading = true;
                          //         });
                          //       }
                          //     }
                          //     if (state is BranchDeepLinkProviderState) {
                          //       if ((state.providerData?.screenName ?? '').isNotEmpty) {
                          //         final data = state.providerData;
                          //         if (data != null) {
                          //           branchIoData = BranchIoData(
                          //             screenName: data.screenName,
                          //             id: data.id,
                          //             token: data.token,
                          //             email: data.email,
                          //             programId: data.programId,
                          //             type: data.type,
                          //             programType: data.programType,
                          //           );
                          //           CommonMethod.instance.welcomeDataProviderLogic(
                          //             data,
                          //             context,
                          //           );
                          //         }
                          //       }
                          //     }
                          //     if (state is SignInFailState) {
                          //       if (mounted) {
                          //         setState(() {
                          //           _isLoading = false;
                          //         });
                          //       }
                          //       final data = state.message;
                          //       if (data != null) {
                          //         CommonMethod.instance
                          //             .toastMessage(data, source: 'LoginScreen - SignInFailState');
                          //       }
                          //     }
                          //     if (state is LoginFailState) {
                          //       if (mounted) {
                          //         setState(() {
                          //           _isLoading = false;
                          //         });
                          //       }
                          //       final data = state.message;
                          //       if (data != null) {
                          //         if (state.status == '4') {
                          //           CommonMethod.showAlertDialog(
                          //             context,
                          //             data,
                          //             () {
                          //               try {
                          //                 _callResendMailApi(
                          //                   email: _emailController.text.trim(),
                          //                 );
                          //               } catch (error, stacktrace) {
                          //                 CommonMethod.instance.setCrashAnalyticsLogEvent(
                          //                   error,
                          //                   stacktrace,
                          //                 );
                          //               }
                          //             },
                          //             title: Language.current.verifyEmail,
                          //             okButtonText: Language.current.resendMail,
                          //           );
                          //         } else {
                          //           CommonMethod.instance
                          //               .toastMessage(data, source: 'LoginScreen - LoginFailState');
                          //         }
                          //       }
                          //     }

                          //     if (state is LoginSuccessState) {
                          //       if (mounted) {
                          //         setState(() {
                          //           _isLoading = false;
                          //         });
                          //       }
                          //       Navigator.pushAndRemoveUntil(
                          //         context,
                          //         MaterialPageRoute<void>(
                          //           builder: (context) => MainNavigation(
                          //             branchIoData: branchIoData,
                          //           ),
                          //         ),
                          //         (r) => false,
                          //       );
                          //     }
                          //     if (state is SignInResendMailSuccessState) {
                          //       if (mounted) {
                          //         setState(() {
                          //           _isLoading = false;
                          //         });
                          //       }
                          //       final data = state.message;
                          //       if (data != null) {
                          //         CommonMethod.instance.toastMessage(data,
                          //             source: 'LoginScreen - SignInResendMailSuccessState');
                          //       }
                          //     }
                          //     if (state is SignInResendMailFailState) {
                          //       if (mounted) {
                          //         setState(() {
                          //           _isLoading = false;
                          //         });
                          //       }
                          //       final data = state.message;
                          //       if (data != null) {
                          //         CommonMethod.instance.toastMessage(data,
                          //             source: 'LoginScreen - SignInResendMailFailState');
                          //       }
                          //     }
                          //   },
                          //   onLoginClickEvent: () async {
                          //     final email = _emailController.text.trim();
                          //     final password = _passwordController.text.trim();
                          //     final isValid = validateInputFieldLogin(
                          //       email: email,
                          //       password: password,
                          //       onCallBack: (String message) {
                          //         CommonMethod.instance.toastMessage(message,
                          //             source: 'LoginScreen - onLoginClickEvent');
                          //       },
                          //     );
                          //     if (isValid) {
                          //       FocusScope.of(context).requestFocus(FocusNode());
                          //       final previousLogin = SocialLogin().getLastLoginTypeNEmail();
                          //       if (previousLogin.email == email &&
                          //           previousLogin.type != LoginType.email) {
                          //         var noPressed = false;
                          //         await showDialog<void>(
                          //           barrierDismissible: false,
                          //           barrierColor: UtilColor.transparent.withOpacity(0.1),
                          //           context: context,
                          //           builder: (BuildContext context) {
                          //             return DeleteAccountDialogScreen(
                          //               title: Language.current.sureConfirmation,
                          //               message: Language.current.previousLoginConfirmation(
                          //                 previousLogin.type.name.toCapitalize(),
                          //                 LoginType.email.name.toCapitalize(),
                          //               ),
                          //               positiveButtonTitle: Language.current.iAmSure,
                          //               onNoClick: () {
                          //                 noPressed = true;
                          //               },
                          //               onYesClick: () {},
                          //             );
                          //           },
                          //         );
                          //         if (noPressed) {
                          //           if (mounted) {
                          //             Navigator.of(context).pop();
                          //           }
                          //           return;
                          //         }
                          //       }

                          //       final internet = await ViewUtils.isConnected();
                          //       if (internet) {
                          //         await _callLoginApi(
                          //           email: email,
                          //           password: password,
                          //         );
                          //       } else {
                          //         if (mounted) {
                          //           await CommonMethod.instance
                          //               .networkErrorMessage(context: context);
                          //         }
                          //       }
                          //     }
                          //   },
                          // ),
                          GymismoStyles.h8,
                          GestureDetector(
                            onTap: onForgotPasswordClick,
                            child: const SizedBox(
                              height: 45,
                              child: Center(
                                child: Text(
                                  'FORGOT PASSWORD',
                                  style: GymismoStyles.tsSilverBlinker18,
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                'Don\'t have an account?',
                                style: GymismoStyles.tsWhiteBlinker14,
                                textAlign: TextAlign.start,
                              ),
                              InkWell(
                                onTap: onSignUpClick,
                                child: const Padding(
                                  padding: EdgeInsets.only(left: GymismoStyles.spacingExtraSmall),
                                  child: Text(
                                    'Signup',
                                    style: GymismoStyles.tsWhiteBlinker14w400,
                                    textAlign: TextAlign.start,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
