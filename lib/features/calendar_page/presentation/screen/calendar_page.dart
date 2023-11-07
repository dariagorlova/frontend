import 'package:flutter/material.dart';
import 'package:frontend/core/navigation/navigations_keys.dart';

class CalendarPage extends StatelessWidget {
  static const String route = NavigationRouteNames.calendarPage;
  const CalendarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Calendar page'));
  }
}
