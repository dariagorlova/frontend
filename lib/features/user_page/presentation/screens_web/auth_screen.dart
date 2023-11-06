// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:frontend/common_widgets/error_toast.dart';
// import 'package:frontend/common_widgets/selectable_text.dart';
// import 'package:frontend/common_widgets/square_button.dart';
// import 'package:frontend/common_widgets/term_and_condition_widget.dart';
// import 'package:frontend/core/constants.dart';
// import 'package:frontend/core/navigation/web_navigation.dart';
// import 'package:frontend/features/user_settings/presentation/bloc/user_cubit.dart';

// class AuthScreen extends StatefulWidget {
//   const AuthScreen({super.key});

//   @override
//   State<AuthScreen> createState() => _AuthScreenState();
// }

// class _AuthScreenState extends State<AuthScreen> {
//   @override
//   Widget build(BuildContext context) {
//     bool isLogin = true;

//     return BlocListener<UserCubit, UserState>(
//       listener: (context, state) {
//         state.maybeWhen(
//             error: (message) => ScaffoldMessenger.of(context).showSnackBar(
//                   errorToasts(message: message),
//                 ),
//             resendEmailAlert: () {},
//             orElse: () {});
//       },
//       child: Scaffold(
//         backgroundColor: backgroundColor,
//         body: LayoutBuilder(
//           builder: (BuildContext context, BoxConstraints constraints) {
//             return SafeArea(
//               child: Stack(
//                 children: [
//                   // const Positioned(
//                   //   right: 20,
//                   //   top: 20,
//                   //   child: VersionInfoText(),
//                   // ),
//                   Center(
//                     child: SingleChildScrollView(
//                       child: Container(
//                         decoration: const BoxDecoration(
//                           color: Colors.black,
//                           borderRadius: BorderRadius.all(Radius.circular(8)),
//                         ),
//                         padding: const EdgeInsets.only(
//                           left: 120,
//                           right: 120,
//                           bottom: 40,
//                           top: 30,
//                         ),
//                         child: Column(
//                           children: <Widget>[
//                             const SizedBox(
//                               height: 10,
//                             ),
//                             SizedBox(
//                               width: 300,
//                               child: Center(
//                                 child: Image.asset(
//                                   'assets/images/logo.png',
//                                   height: 50,
//                                 ),
//                               ),
//                             ),
//                             const SizedBox(
//                               height: 35,
//                             ),
//                             SizedBox(
//                               width: 300,
//                               child: Column(
//                                 mainAxisSize: MainAxisSize.min,
//                                 children: [
//                                   // if (kIsWeb || Platform.isIOS)
//                                   SquareButton(
//                                     path:
//                                         'assets/images/ic_apple.png', //Assets.images.icApple.path,
//                                     text: isLogin ? 'SIGN IN WITH APPLE ' : 'SIGN UP WITH APPLE ',
//                                     fun: () {}, //widget.appleSignInAction,
//                                   ),
//                                   Padding(
//                                     padding: const EdgeInsets.only(top: 16),
//                                     child: SquareButton(
//                                       path:
//                                           'assets/images/ic_google.png', //Assets.images.icGoogle.path,
//                                       text:
//                                           isLogin ? 'SIGN IN WITH GOOGLE ' : 'SIGN UP WITH GOOGLE ',
//                                       fun: () {}, //widget.googleSignInAction,
//                                     ),
//                                   ),
//                                   //if (RemoteConfigHelper.instance.isFacebookActive)
//                                   Padding(
//                                     padding: const EdgeInsets.only(top: spacingSmall),
//                                     child: SquareButton(
//                                       path:
//                                           'assets/images/ic_facebook.png', //Assets.images.icFacebook.path,
//                                       text: isLogin
//                                           ? 'SIGN IN WITH FACEBOOK '
//                                           : 'SIGN UP WITH FACEBOOK ',
//                                       fun: () {}, //widget.facebookSignInAction,
//                                     ),
//                                   ),
//                                   Padding(
//                                     padding: const EdgeInsets.only(top: spacingSmall),
//                                     child: SquareButton(
//                                       path:
//                                           'assets/images/ic_mail.png', //Assets.images.icMail.path,
//                                       text: isLogin ? 'SIGN IN WITH EMAIL' : 'SIGN UP WITH EMAIL',
//                                       fun: isLogin ? _emailSignInAction : _emailSignUpAction,
//                                     ),
//                                   ),
//                                   const SizedBox(height: spacingSmall),
//                                   Row(
//                                     children: [
//                                       const Expanded(
//                                         child: Divider(
//                                           color: faint,
//                                           thickness: 2,
//                                         ),
//                                       ),
//                                       Padding(
//                                         padding: const EdgeInsets.only(left: 15, right: 15),
//                                         child: Text(
//                                           'OR',
//                                           style: Theme.of(context).textTheme.titleMedium?.copyWith(
//                                                 color: Colors.white,
//                                                 fontFamily: archivo,
//                                                 fontWeight: FontWeight.w400,
//                                                 fontSize: 14,
//                                               ),
//                                         ),
//                                       ),
//                                       const Expanded(
//                                         child: Divider(
//                                           color: faint,
//                                           thickness: 2,
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                   const SizedBox(
//                                     height: spacingSmall,
//                                   ),
//                                   SelectableTextCustomStyle(
//                                     text: !isLogin
//                                         ? 'Already have an account?'
//                                         : 'Don\'t have an account?',
//                                     style: const TextStyle(
//                                       fontSize: 12,
//                                       color: gainsBoro,
//                                       fontFamily: archivo,
//                                     ),
//                                   ),
//                                   Padding(
//                                     padding: const EdgeInsets.all(5),
//                                     child: SelectableTextCustomStyle(
//                                       onclick: () {
//                                         isLogin = !isLogin;
//                                       }, // widget.onLoginModeChange,
//                                       text: !isLogin ? 'LOG IN' : 'SIGN UP ',
//                                       style: const TextStyle(
//                                         fontSize: 12,
//                                         fontWeight: FontWeight.w400,
//                                         color: textFieldFocusBorder_2,
//                                         fontFamily: archivo,
//                                       ),
//                                     ),
//                                   ),
//                                   const SizedBox(
//                                     height: spacingLarge,
//                                   ),
//                                   const TermsAndConditionWidget(),
//                                 ],
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//                   //if (_isLoading) const ShowProgressBar()
//                 ],
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }

//   void _emailSignInAction() {
//     WebNavigationActions.instance.showSignInScreen();
//   }

//   void _emailSignUpAction() {
//     WebNavigationActions.instance.showSignUpScreen();
//   }
// }
