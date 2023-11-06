import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/features/auth/presentation/bloc/auth_cubit.dart';
import 'package:frontend/features/auth/presentation/screens/mobile_app.dart';
import 'package:frontend/features/user_page/presentation/bloc/user_cubit.dart';
import 'package:frontend/service_locator.dart' as di;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.initDI();
  // device id
  //runApp(kIsWeb ? const WebApp() : mobile(child: const MobileApp()));
  runApp(mobile(child: const MobileApp()));
}

Widget mobile({required Widget child}) {
  return MultiBlocProvider(providers: [
    BlocProvider<AuthCubit>(create: (context) => di.instance<AuthCubit>()..isAuthenticated()),
    BlocProvider<UserCubit>(create: (context) => di.instance<UserCubit>()),
  ], child: child);
}
