import 'package:flutter/material.dart';
import 'package:frontend/core/navigation/navigations_keys.dart';

class MainPage extends StatelessWidget {
  static const String route = NavigationRouteNames.mainPage;
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Main page'));
  }
}
