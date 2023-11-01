import 'package:flutter/material.dart';
import 'package:frontend/core/navigation/navigation.dart';
import 'package:frontend/feature/presentation/screens/auth/auth_screen.dart';
import 'package:frontend/feature/presentation/screens/main_tab_screen.dart';
import 'package:frontend/feature/presentation/screens/settings_screen.dart';
import 'package:frontend/feature/presentation/screens/splash_screen.dart';
import 'package:frontend/feature/presentation/widgets/check_your_email.dart';
import 'package:shared_models/shared_models.dart';

class MobileNavigationImpl implements AppNavigation {
  @override
  String get initialRoute => NavigationRouteNames.splashScreen;

  @override
  Route<Object> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case NavigationRouteNames.mainScreen:
        return MaterialPageRoute(builder: (context) => const MainTabScreen());

      case NavigationRouteNames.splashScreen:
        return MaterialPageRoute(builder: (context) => const SplashScreen());

      case NavigationRouteNames.loginScreen:
        return MaterialPageRoute(builder: (context) => const AuthScreen());

      case NavigationRouteNames.settingsScreen:
        return MaterialPageRoute(builder: (context) => const SettingsScreen());

      case NavigationRouteNames.checkYourEmailScreen:
        return MaterialPageRoute(
            builder: (context) => CheckYourEmailScreen(email: settings.arguments as String));

      default:
        const widget = Scaffold(body: Center(child: Text('Error')));
        return MaterialPageRoute(builder: (context) => widget);
    }
  }
}

class MobileNavigationActions {
  static const instance = MobileNavigationActions._();
  const MobileNavigationActions._();
  static final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  /// back to previous page
  void backToPreviousPage() {
    navigatorKey.currentState?.pop();
  }

  // move authenticated user to main page
  void showMainScreen() {
    navigatorKey.currentState
        ?.pushNamedAndRemoveUntil(NavigationRouteNames.mainScreen, (route) => false);
  }

  void showLoginScreen() {
    navigatorKey.currentState
        ?.pushNamedAndRemoveUntil(NavigationRouteNames.loginScreen, (route) => false);
  }

  Future<Object?>? showCheckYourEmailScreen({required String email}) {
    return navigatorKey.currentState?.pushNamed(
      NavigationRouteNames.checkYourEmailScreen,
      arguments: email,
    );
  }

  Future<Object?>? showSettingsScreen({
    required User user,
  }) {
    return navigatorKey.currentState?.pushNamed(
      NavigationRouteNames.settingsScreen,
      arguments: user,
    );
  }
}
