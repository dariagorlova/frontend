// import 'package:flutter/material.dart';
// import 'package:frontend/core/navigation/navigation.dart';
// import 'package:frontend/feature/presentation/screens_web/auth/auth_screen.dart';
// import 'package:frontend/feature/presentation/screens_web/auth/login_screen.dart';
// import 'package:frontend/feature/presentation/screens_web/auth/signup_screen.dart';
// import 'package:frontend/feature/presentation/screens_web/main_screen.dart';
// import 'package:frontend/feature/presentation/screens_web/splash_screen.dart';

// class WebNavigationImpl implements AppNavigation {
//   @override
//   String get initialRoute => NavigationRouteNames.splashScreen;

//   @override
//   Route<Object> onGenerateRoute(RouteSettings settings) {
//     switch (settings.name) {
//       case NavigationRouteNames.mainScreen:
//         return MaterialPageRoute(builder: (context) => const MainScreen());

//       case NavigationRouteNames.splashScreen:
//         return MaterialPageRoute(builder: (context) => const SplashScreen());

//       case NavigationRouteNames.loginScreen:
//         return MaterialPageRoute(builder: (context) => const AuthScreen());

//       case NavigationRouteNames.signInScreen:
//         return MaterialPageRoute(builder: (context) => const LoginScreen());

//       case NavigationRouteNames.signupScreen:
//         return MaterialPageRoute(builder: (context) => const SignUpScreen());

//       default:
//         const widget = Scaffold(body: Center(child: Text('Error')));
//         return MaterialPageRoute(builder: (context) => widget);
//     }
//   }
// }

// class WebNavigationActions {
//   static const instance = WebNavigationActions._();
//   const WebNavigationActions._();
//   static final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

//   /// back to previous page
//   void backToPreviousPage() {
//     navigatorKey.currentState?.pop();
//   }

//   // move authenticated user to main page
//   void showMainScreen() {
//     navigatorKey.currentState
//         ?.pushNamedAndRemoveUntil(NavigationRouteNames.mainScreen, (route) => false);
//   }

//   void showLoginScreen() {
//     navigatorKey.currentState
//         ?.pushNamedAndRemoveUntil(NavigationRouteNames.loginScreen, (route) => false);
//   }

//   void showSignInScreen() {
//     navigatorKey.currentState
//         ?.pushNamedAndRemoveUntil(NavigationRouteNames.signInScreen, (route) => false);
//   }

//   void showSignUpScreen() {
//     navigatorKey.currentState
//         ?.pushNamedAndRemoveUntil(NavigationRouteNames.signupScreen, (route) => false);
//   }

//   // Future<Object?>? showCheckYourEmailScreen({required String email}) {
//   //   return navigatorKey.currentState?.pushNamed(
//   //     NavigationRouteNames.checkYourEmailScreen,
//   //     arguments: email,
//   //   );
//   // }

//   // Future<Object?>? showSettingsScreen({
//   //   required User user,
//   // }) {
//   //   return navigatorKey.currentState?.pushNamed(
//   //     NavigationRouteNames.settingsScreen,
//   //     arguments: user,
//   //   );
//   // }
// }
