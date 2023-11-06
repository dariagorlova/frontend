import 'package:flutter/material.dart';
import 'package:frontend/core/styles/colors.dart';

class GymismoTheme {
  // here we have themes, based on GymismoColors and GymismoStyles
  static ThemeData dark = ThemeData(
    canvasColor: Colors.transparent,
    scaffoldBackgroundColor: GymismoColors.backgroundColor,
    colorScheme: ColorScheme.fromSeed(
      brightness: Brightness.dark,
      seedColor: const Color(0xFFAABBCC),
//      primary: HomeAutomationColors.darkPrimary,
//      secondary: HomeAutomationColors.darkSecondary,
//      tertiary: HomeAutomationColors.darkTertiary,
      background: GymismoColors.backgroundColor,
    ),
  );
}
