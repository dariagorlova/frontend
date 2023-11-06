import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/core/utils/utils.dart';
import 'package:frontend/features/auth/presentation/bloc/auth_cubit.dart';
import 'package:frontend/features/calendar_page/presentation/screen/calendar_page.dart';
import 'package:frontend/features/main_page/presentation/screen/main_page.dart';
import 'package:frontend/features/main_tab/presentation/screen/main_tab_screen.dart';
import 'package:frontend/features/navigation/data/repository/bottom_bar_repository.dart';
import 'package:frontend/features/navigation/presentation/bloc/navigation_cubit.dart';
import 'package:frontend/features/programs_page/presentation/screen/programs_page.dart';
import 'package:frontend/features/store_page/presentation/screen/store_page.dart';
import 'package:frontend/features/user_page/presentation/screens/auth_screen.dart';
import 'package:frontend/features/user_page/presentation/screens/user_page.dart';
import 'package:frontend/splash_screen.dart';
import 'package:go_router/go_router.dart';

class AppRoutes {
  static final router = GoRouter(
    redirect: (context, state) {
      final auth = context.read<AuthCubit>();
      return auth.state.maybeWhen<String?>(
        authenticated: (user) => null,
        restricted: () => AuthScreen.route,
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
        path: AuthScreen.route,
        builder: (context, state) => const AuthScreen(),
      ),

      /// main_tab landing page
      /// bottom buttons navigation
      ShellRoute(
        navigatorKey: Utils.tabNavigation,
        builder: (context, state, child) {
          //return MainTabScreen(child: child);
          return BlocProvider<NavigationCubit>(
            create: (context) => NavigationCubit(repository: BottomBarRepository()),
            child: MainTabScreen(child: child),
          );
        },
        routes: [
          /// main page
          GoRoute(
            parentNavigatorKey: Utils.tabNavigation,
            path: MainPage.route,
            pageBuilder: (context, state) {
              return const NoTransitionPage(
                child: MainPage(),
              );
            },
          ),

          /// calendar page
          GoRoute(
            parentNavigatorKey: Utils.tabNavigation,
            path: CalendarPage.route,
            pageBuilder: (context, state) {
              return const NoTransitionPage(
                child: CalendarPage(),
              );
            },
          ),

          /// store page
          GoRoute(
            parentNavigatorKey: Utils.tabNavigation,
            path: StorePage.route,
            pageBuilder: (context, state) {
              return const NoTransitionPage(
                child: StorePage(),
              );
            },
          ),

          /// programs page
          GoRoute(
            parentNavigatorKey: Utils.tabNavigation,
            path: ProgramsPage.route,
            pageBuilder: (context, state) {
              return const NoTransitionPage(
                child: ProgramsPage(),
              );
            },
          ),

          ///user page
          GoRoute(
            parentNavigatorKey: Utils.tabNavigation,
            path: UserPage.route,
            pageBuilder: (context, state) {
              return const NoTransitionPage(
                child: UserPage(),
              );
            },
          ),
        ],
      ),
    ],
  );
}
