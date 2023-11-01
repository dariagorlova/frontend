import 'dart:math';

import 'package:flutter/material.dart';
import 'package:frontend/feature/presentation/widgets/rectangle_button.dart';
import 'package:frontend/mobile_navigation.dart';
import 'package:shared_models/shared_models.dart';

class MainTabScreen extends StatelessWidget {
  const MainTabScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final buttonWidth = min<double>(MediaQuery.of(context).size.width * 0.8, 400);

    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: RectangleButton(
          onClick: () {
            MobileNavigationActions.instance.showSettingsScreen(user: User.empty());
          },
          text: 'SETTINGS',
          width: buttonWidth,
        ),
      ),
    );
  }
}
