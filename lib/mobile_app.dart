import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/core/navigation/navigation.dart';
import 'package:frontend/feature/presentation/bloc/auth/auth_cubit.dart';
import 'package:frontend/feature/presentation/bloc/user/user_cubit.dart';
import 'package:frontend/mobile_navigation.dart';

import 'service_locator.dart' as di;

class MobileApp extends StatelessWidget {
  const MobileApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthCubit>(create: (context) => di.instance<AuthCubit>()..isAuthenticated()),
        BlocProvider<UserCubit>(create: (context) => di.instance<UserCubit>()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        navigatorKey: MobileNavigationActions.navigatorKey,
        initialRoute: di.instance<AppNavigation>().initialRoute,
        builder: (context, child) {
          return BlocListener<AuthCubit, AuthState>(
            listenWhen: (previous, current) => previous != current,
            listener: (context, state) {
              state.maybeWhen(
                authenticated: (user) => MobileNavigationActions.instance.showMainScreen(),
                restricted: () => MobileNavigationActions.instance.showLoginScreen(),
                orElse: () {},
              );
            },
            child: child,
          );
        },
        onGenerateRoute: di.instance<AppNavigation>().onGenerateRoute,
      ),
    );
  }
}
