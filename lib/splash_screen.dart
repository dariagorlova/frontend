import 'dart:async';

import 'package:flutter/material.dart';
import 'package:frontend/core/services/toast_service.dart';
import 'package:frontend/core/styles/images.dart';
import 'package:frontend/core/utils/utils.dart';
import 'package:frontend/features/main_page/presentation/screen/main_page.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends StatefulWidget {
  static const String route = '/splash';
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Timer durationTimer = Timer(Duration.zero, () {});

  @override
  void dispose() {
    durationTimer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    GymismoToast.instance.init(Utils.mainNavigation.currentContext!);
    durationTimer = Timer(const Duration(seconds: 2), () {
      GoRouter.of(Utils.mainNavigation.currentContext!).go(MainPage.route);
    });

    return _initProgram(context);
  }

  Widget _initProgram(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Image.asset(
            GymismoImages.logo,
            fit: BoxFit.cover,
            width: 250,
          ),
        ),
      ),
    );
  }
}
