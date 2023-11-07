import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/core/utils/utils.dart';
import 'package:frontend/features/auth/presentation/bloc/auth_cubit.dart';
import 'package:frontend/features/main_tab/presentation/screen_web/main_tab_screen_web.dart';
import 'package:frontend/features/user_page/presentation/screens_web/auth_screen.dart';
import 'package:frontend/splash_screen.dart';
import 'package:go_router/go_router.dart';

class AppRoutesWeb {
  static final router = GoRouter(
    redirect: (context, state) {
      final auth = context.read<AuthCubit>();
      return auth.state.maybeWhen<String?>(
        authenticated: (user) => null,
        restricted: () => AuthScreenWeb.route,
        orElse: () => null,
      );
    },
    routerNeglect: true,
    initialLocation: SplashScreen.route,
    navigatorKey: Utils.mainNavigation,
    routes: [
      /// initial splash page
      GoRoute(
        parentNavigatorKey: Utils.mainNavigation,
        path: SplashScreen.route,
        builder: (context, state) => const SplashScreen(),
      ),

      /// login page
      GoRoute(
        parentNavigatorKey: Utils.mainNavigation,
        path: AuthScreenWeb.route,
        builder: (context, state) => const AuthScreenWeb(),
      ),

      GoRoute(
        parentNavigatorKey: Utils.mainNavigation,
        path: MainTabScreenWeb.route,
        builder: (context, state) => const MainTabScreenWeb(),
      ),
    ],
  );
}
