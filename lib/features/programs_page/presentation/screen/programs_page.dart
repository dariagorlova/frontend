import 'package:flutter/material.dart';
import 'package:frontend/core/navigation/navigations_keys.dart';

class ProgramsPage extends StatelessWidget {
  static const String route = NavigationRouteNames.programsPage;
  const ProgramsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Programs page'));
  }
}
