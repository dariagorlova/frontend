import 'package:flutter/material.dart';
import 'package:frontend/core/styles/colors.dart';
import 'package:frontend/features/navigation/presentation/widget/bottom_bar.dart';

class MainTabScreen extends StatelessWidget {
  static const String route = '/main_tab';
  const MainTabScreen({required this.child, super.key});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GymismoColors.backgroundColor,
      body: Flex(
        direction: Axis.vertical,
        children: [
          Expanded(child: SafeArea(bottom: false, child: child)),
          const BottomBar(),
        ],
      ),
    );
  }
}
