import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:frontend/core/navigation/web_routes.dart';
import 'package:frontend/core/styles/themes.dart';

class WebApp extends StatelessWidget {
  const WebApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return MaterialApp.router(
      builder: FToastBuilder(),
      title: 'Gymismo',
      theme: GymismoTheme.dark,
      darkTheme: GymismoTheme.dark,
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      routeInformationProvider: AppRoutesWeb.router.routeInformationProvider,
      routeInformationParser: AppRoutesWeb.router.routeInformationParser,
      routerDelegate: AppRoutesWeb.router.routerDelegate,
    );
  }
}
