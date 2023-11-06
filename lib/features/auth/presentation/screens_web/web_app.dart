// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:frontend/core/navigation/navigation.dart';
// import 'package:frontend/core/navigation/web_navigation.dart';
// import 'package:frontend/features/auth/presentation/bloc/auth_cubit.dart';
// import 'package:frontend/features/user_settings/presentation/bloc/user_cubit.dart';
// import 'package:frontend/service_locator.dart' as di;

// class WebApp extends StatelessWidget {
//   const WebApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
//     return MultiBlocProvider(
//       providers: [
//         BlocProvider<AuthCubit>(create: (context) => di.instance<AuthCubit>()..isAuthenticated()),
//         BlocProvider<UserCubit>(create: (context) => di.instance<UserCubit>()),
//       ],
//       child: MaterialApp(
//         debugShowCheckedModeBanner: false,
//         navigatorKey: WebNavigationActions.navigatorKey,
//         initialRoute: di.instance<AppNavigation>().initialRoute,
//         builder: (context, child) {
//           return BlocListener<AuthCubit, AuthState>(
//             listenWhen: (previous, current) => previous != current,
//             listener: (context, state) {
//               state.maybeWhen(
//                 authenticated: (user) => WebNavigationActions.instance.showMainScreen(),
//                 restricted: () => WebNavigationActions.instance.showLoginScreen(),
//                 orElse: () {},
//               );
//             },
//             child: child,
//           );
//         },
//         onGenerateRoute: di.instance<AppNavigation>().onGenerateRoute,
//       ),
//     );
//   }
// }
