// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:frontend/common_widgets/button_blue.dart';
// import 'package:frontend/common_widgets/selectable_text.dart';
// import 'package:frontend/core/constants.dart';
// import 'package:frontend/core/navigation/web_navigation.dart';
// import 'package:frontend/features/user_settings/presentation/bloc/user_cubit.dart';

// class LoginScreen extends StatefulWidget {
//   const LoginScreen({super.key});

//   @override
//   State<LoginScreen> createState() => _LoginScreenState();
// }

// class _LoginScreenState extends State<LoginScreen> {
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();
//   final TextEditingController _forgotPasswordEmailController = TextEditingController();
//   final FocusNode _passwordFocusNode = FocusNode();
//   Color buttonColor = const Color.fromRGBO(0, 140, 197, 1).withOpacity(0.5);

//   @override
//   void initState() {
//     super.initState();

//     //_getWebIp();
//     //_initPlatformState();
//     // if (GlobalVariables.currentTimezone.isEmpty) {
//     //   CommonMethod.instance
//     //       .getTimezone(isWeb: true)
//     //       .then((value) => GlobalVariables.currentTimezone = value);
//     // }
//     //_emailController.text = const String.fromEnvironment('DEFAULT_EMAIL_LOGIN');
//     //_passwordController.text = const String.fromEnvironment('DEFAULT_EMAIL_PASSWORD');
//   }

//   @override
//   void dispose() {
//     _emailController.dispose();
//     _passwordController.dispose();
//     _forgotPasswordEmailController.dispose();
//     _passwordFocusNode.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     bool isDesktop =
//         (MediaQuery.of(context).size.width >= 1200 && MediaQuery.of(context).size.width < 1960) ||
//             (MediaQuery.of(context).size.width >= 1960);

//     SystemChrome.setSystemUIOverlayStyle(
//       SystemUiOverlayStyle.dark.copyWith(
//         // Color for Android
//         statusBarIconBrightness: Brightness.light,
//         statusBarBrightness: Brightness.dark,
//       ),
//     );
//     return Scaffold(
//       backgroundColor: backgroundColor,
//       body: LayoutBuilder(
//         builder: (BuildContext context, BoxConstraints constraints) {
//           return SafeArea(
//             child: Center(
//               child: SingleChildScrollView(
//                 child: Container(
//                   alignment: Alignment.center,
//                   decoration: const BoxDecoration(
//                     color: Colors.black,
//                     borderRadius: BorderRadius.all(Radius.circular(8)),
//                   ),
//                   padding: const EdgeInsets.only(left: 30, right: 30, bottom: 20),
//                   width: isDesktop
//                       ? MediaQuery.of(context).size.width / 3
//                       : MediaQuery.of(context).size.width / 2,
//                   child: Stack(
//                     children: [
//                       Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: <Widget>[
//                           const SizedBox(
//                             height: spacingMedium,
//                           ),
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               InkWell(
//                                 onTap: () {
//                                   // CommonMethod.instance.removeCustomToast();
//                                   // _captchaBloc.hide();
//                                   //Navigator.pop(context, 'back');
//                                   WebNavigationActions.instance.backToPreviousPage();
//                                 },
//                                 child: const Icon(
//                                   Icons.arrow_back_ios_rounded,
//                                   color: Colors.white,
//                                   size: 20,
//                                 ),
//                               ),
//                               InkWell(
//                                 onTap: () {
//                                   // CommonMethod.instance.removeCustomToast();
//                                   // _captchaBloc.hide();
//                                   //Navigator.pop(context, 'back');
//                                   WebNavigationActions.instance.backToPreviousPage();
//                                 },
//                                 child: const Icon(
//                                   Icons.clear,
//                                   color: Colors.white,
//                                   size: 20,
//                                 ),
//                               )
//                             ],
//                           ),
//                           const SizedBox(
//                             height: spacingMedium,
//                           ),
//                           Container(
//                             alignment: Alignment.center,
//                             width: 400,
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 const SelectableTextCustomStyle(
//                                   text: 'EMAIL LOG IN',
//                                   style: TextStyle(
//                                     fontSize: 12, //ResizeScreen.getFontSizeFromPixel(context,12),
//                                     color: Colors.white,
//                                     fontFamily: blinker,
//                                   ),
//                                 ),
//                                 const SizedBox(
//                                   height: 5,
//                                 ),
//                                 const SelectableTextCustomStyle(
//                                   text: 'Login for Gymismo',
//                                   style: TextStyle(
//                                     fontSize: 26, //ResizeScreen.getFontSizeFromPixel(context,26),
//                                     color: Colors.white,
//                                     fontWeight: FontWeight.w600,
//                                     fontFamily: blinker,
//                                   ),
//                                 ),
//                                 const SizedBox(
//                                   height: spacingLarge,
//                                 ),
//                                 AutofillGroup(
//                                   child: Column(
//                                     children: [
//                                       const Align(
//                                         alignment: Alignment.centerLeft,
//                                         child: SelectableTextCustomStyle(
//                                           text: 'Email',
//                                           style: TextStyle(
//                                             fontSize:
//                                                 12, //ResizeScreen.getFontSizeFromPixel(context,12),
//                                             color: faint,
//                                             fontFamily: blinker,
//                                             fontWeight: FontWeight.w400,
//                                           ),
//                                         ),
//                                       ),
//                                       const SizedBox(
//                                         height: 5,
//                                       ),
//                                       Theme(
//                                         data: ThemeData(
//                                           textSelectionTheme: TextSelectionThemeData(
//                                             cursorColor: white,
//                                             selectionColor: lightSkyBlue.withOpacity(0.4),
//                                             selectionHandleColor: lightSkyBlue,
//                                           ),
//                                         ),
//                                         child: TextField(
//                                           controller: _emailController,
//                                           cursorColor: Colors.white,
//                                           keyboardType: TextInputType.emailAddress,
//                                           autofillHints: const [AutofillHints.email],
//                                           style: const TextStyle(
//                                             fontSize: 14,
//                                             color: Colors.white,
//                                             fontFamily: blinker,
//                                           ),
//                                           onChanged: (text) {
//                                             // if (text.isEmpty || _passwordController.text.isEmpty) {
//                                             //   buttonColor = buttonColor.withOpacity(0.5);
//                                             //   _captchaBloc.hide();
//                                             // } else {
//                                             //   buttonColor = buttonFullFileColor;
//                                             //   _captchaBloc.show();
//                                             // }
//                                             // if (mounted) {
//                                             //   setState(() {
//                                             //     buttonColor = buttonColor;
//                                             //   });
//                                             // }
//                                           },
//                                           decoration: InputDecoration(
//                                             hintText: 'Enter email',
//                                             hintStyle: const TextStyle(
//                                               fontSize: 12,
//                                               color: Colors.white,
//                                               fontFamily: blinker,
//                                             ),
//                                             border: OutlineInputBorder(
//                                               borderRadius: BorderRadius.circular(8),
//                                               borderSide: BorderSide.none,
//                                             ),
//                                             focusedBorder: const OutlineInputBorder(
//                                               borderSide: BorderSide(
//                                                 color: cerulean,
//                                               ),
//                                             ),
//                                             filled: true,
//                                             contentPadding: const EdgeInsets.all(16),
//                                             fillColor: mineshaft,
//                                           ),
//                                           onSubmitted: (value) {
//                                             FocusScope.of(context).requestFocus(
//                                               _passwordFocusNode,
//                                             );
//                                           },
//                                         ),
//                                       ),
//                                       const SizedBox(
//                                         height: spacingSmall,
//                                       ),
//                                       const Align(
//                                         alignment: Alignment.centerLeft,
//                                         child: SelectableTextCustomStyle(
//                                           text: 'Password',
//                                           style: TextStyle(
//                                             fontSize:
//                                                 12, //ResizeScreen.getFontSizeFromPixel(context,12),
//                                             color: faint,
//                                             fontFamily: blinker,
//                                             fontWeight: FontWeight.w400,
//                                           ),
//                                         ),
//                                       ),
//                                       const SizedBox(
//                                         height: 5,
//                                       ),
//                                       Theme(
//                                         data: ThemeData(
//                                           textSelectionTheme: TextSelectionThemeData(
//                                             cursorColor: white,
//                                             selectionColor: lightSkyBlue.withOpacity(0.4),
//                                             selectionHandleColor: lightSkyBlue,
//                                           ),
//                                         ),
//                                         child: TextField(
//                                           obscureText: true,
//                                           focusNode: _passwordFocusNode,
//                                           controller: _passwordController,
//                                           keyboardType: TextInputType.text,
//                                           cursorColor: Colors.white,
//                                           autofillHints: const [AutofillHints.password],
//                                           style: const TextStyle(
//                                             fontSize: 14,
//                                             color: Colors.white,
//                                             fontFamily: blinker,
//                                           ),
//                                           onChanged: (text) {
//                                             // if (text.isEmpty || _emailController.text.isEmpty) {
//                                             //   buttonColor = buttonColor.withOpacity(0.5);
//                                             //   _captchaBloc.hide();
//                                             // } else {
//                                             //   buttonColor = buttonFullFileColor;
//                                             //   _captchaBloc.show();
//                                             // }
//                                             // if (mounted) {
//                                             //   setState(() {
//                                             //     buttonColor = buttonColor;
//                                             //   });
//                                             // }
//                                           },
//                                           decoration: InputDecoration(
//                                             hintText: 'Enter password',
//                                             hintStyle: const TextStyle(
//                                               fontSize: 12,
//                                               color: Colors.white,
//                                               fontFamily: blinker,
//                                             ),
//                                             border: OutlineInputBorder(
//                                               borderRadius: BorderRadius.circular(8),
//                                               borderSide: BorderSide.none,
//                                             ),
//                                             focusedBorder: const OutlineInputBorder(
//                                               borderSide: BorderSide(
//                                                 color: cerulean,
//                                               ),
//                                             ),
//                                             filled: true,
//                                             contentPadding: const EdgeInsets.all(16),
//                                             fillColor: mineshaft,
//                                           ),
//                                           onSubmitted: (value) {
//                                             _passwordFocusNode.unfocus();
//                                             _formSubmitLogic();
//                                           },
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                                 const SizedBox(
//                                   height: spacingLarge,
//                                 ),
//                                 const Text(
//                                   'By continuing you indicate that you agree to Gymismo’s Terms of Service and Privacy Policy',
//                                   style: TextStyle(
//                                     fontSize: 12, //ResizeScreen.getFontSizeFromPixel(context, 12),
//                                     letterSpacing: 0.35,
//                                     color: faint,
//                                     fontFamily: blinker,
//                                   ),
//                                   textAlign: TextAlign.start,
//                                 ),
//                                 const SizedBox(
//                                   height: spacingLarge,
//                                 ),
//                                 BlocBuilder<UserCubit, UserState>(
//                                   builder: (context, login) {
//                                     return MultiBlocListener(
//                                       listeners: [
//                                         BlocListener<UserCubit, UserState>(
//                                           listener: (context, state) {
//                                             // do stuff here based on BlocA's state
//                                             //_loginBlocListenerLogic(state);
//                                           },
//                                         ),
//                                       ],
//                                       child: ButtonBlue(
//                                         onClick: () {
//                                           //CommonMethod.instance.removeCustomToast();
//                                           _formSubmitLogic();
//                                         },
//                                         color: buttonColor,
//                                         text: 'SIGN IN WITH EMAIL',
//                                         width: (MediaQuery.of(context).size.width -
//                                                 (spacingMedium * 3)) /
//                                             2,
//                                       ),
//                                     );
//                                   },
//                                 ),
//                                 const SizedBox(height: spacingMedium),
//                                 //Forgot button
//                                 _forgotPasswordButton(context),
//                                 const SizedBox(height: spacingExtraSmall),
//                                 _signUpViewButton(context)
//                               ],
//                             ),
//                           )
//                         ],
//                       ),
//                       // if (_isLoading)
//                       //   const Positioned(
//                       //     left: 0,
//                       //     right: 0,
//                       //     top: 0,
//                       //     bottom: 0,
//                       //     child: ShowProgressBar(),
//                       //   )
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }

//   Widget _forgotPasswordButton(BuildContext context) {
//     return Center(
//       child: InkWell(
//         onTap: () {
//           //_openForgetPasswordDialog(context);
//         }, // Handle your callback
//         child: const Padding(
//           padding: const EdgeInsets.all(5),
//           child: Text(
//             'FORGOT PASSWORD',
//             style: TextStyle(
//               fontSize: 14,
//               fontWeight: FontWeight.w400,
//               color: faint,
//               fontFamily: blinker,
//             ),
//             textAlign: TextAlign.center,
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _signUpViewButton(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         const SelectableTextCustomStyle(
//           text: 'Don\'t have an account?',
//           style: TextStyle(
//             fontSize: 12,
//             color: faint,
//             fontFamily: blinker,
//           ),
//         ),
//         InkWell(
//           onTap: () {
//             // CommonMethod.instance.removeCustomToast();
//             // _captchaBloc.hide();
//             //Navigator.of(context).pushNamed(signUpScreenRoute);
//             WebNavigationActions.instance.showSignUpScreen();
//           }, // Handle your callback
//           child: const Padding(
//             padding: EdgeInsets.all(5),
//             child: Text(
//               'SIGN UP ',
//               style: TextStyle(
//                 fontSize: 14,
//                 fontWeight: FontWeight.w400,
//                 color: textFieldFocusBorder_2,
//                 fontFamily: blinker,
//               ),
//               textAlign: TextAlign.start,
//             ),
//           ),
//         ),
//       ],
//     );
//   }

//   Future<void> _getWebIp() async {
//     // try {
//     //   var ipv4 = '';
//     //   ipv4 = await Ipify.ipv64();
//     //   await _appPreferences.setWebIPType(deviceId: ipv4);
//     // } catch (error, stacktrace) {
//     //   CommonMethod.instance.setCrashAnalyticsLogEvent(error, stacktrace);
//     // }
//   }

//   Future<void> _initPlatformState() async {
//     // try {
//     //   var deviceData = <String, dynamic>{};
//     //   final deviceInfo = DeviceInfoPlugin();
//     //   final webBrowserInfo = await deviceInfo.webBrowserInfo;
//     //
//     //   deviceData = CommonMethod.readWebBrowserInfo(
//     //     await deviceInfoPlugin.webBrowserInfo,
//     //   );
//     //   await _appPreferences.setDeviceType(deviceType: 'Web');
//     //   await _appPreferences.setDeviceOS(
//     //     deviceOSVersion: deviceData['appVersion'] as String? ?? '',
//     //   );
//     //   await _appPreferences.setDeviceID(deviceId: webBrowserInfo.userAgent ?? '');
//     //   await _appPreferences.setDeviceName(deviceName: deviceData['browserName'] as String? ?? '');
//     // } catch (error, stacktrace) {
//     //   CommonMethod.instance.setCrashAnalyticsLogEvent(error, stacktrace);
//     // }
//   }

//   void _formSubmitLogic() {
//     final email = _emailController.text.trim();
//     final password = _passwordController.text.trim();

//     final isValid = checkValidationWebLogin(
//       email: email,
//       password: password,
//       onCallBack: (message) {
//         toastMessage(message, source: 'Welcome _formSubmitLogic');
//       },
//     );

//     if (isValid) {
//       context.read<UserCubit>().logIn(email, password);
//     }
//   }

//   bool checkValidationWebLogin({
//     required String email,
//     required String password,
//     required void Function(String) onCallBack,
//   }) {
//     if (email == '') {
//       onCallBack('Please enter an email.');
//       return false;
//     }
//     if (!isValidEmail(email)) {
//       onCallBack('Please enter a valid email.');
//       return false;
//     }
//     if (password == '') {
//       onCallBack('Please enter a password.');
//       return false;
//     }

//     return true;
//   }

//   bool isValidEmail(String email) {
//     final emailValid = RegExp(
//       r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
//     ).hasMatch(email);
//     return emailValid;
//   }

//   Future<void> toastMessage(String? message, {int showTimeInSeconds = 4, String? source}) async {
//     if (message == null || message.isEmpty) {
//       return;
//     }
//     final toast = Container(
//       padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
//       decoration: BoxDecoration(
//         color: Colors.black54,
//         borderRadius: BorderRadius.circular(2),
//       ),
//       child: Text(
//         message,
//         maxLines: 5,
//         style: const TextStyle(
//           color: Colors.white,
//           fontFamily: blinker,
//           fontWeight: FontWeight.w400,
//           fontSize: 14,
//         ),
//       ),
//     );

//     FToast().showToast(
//       child: toast,
//       toastDuration: Duration(seconds: showTimeInSeconds),
//       gravity: kIsWeb ? ToastGravity.BOTTOM_RIGHT : ToastGravity.BOTTOM,
//     );
//   }
// }
