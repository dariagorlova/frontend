import 'package:flutter/material.dart';
import 'package:frontend/core/navigation/navigations_keys.dart';

class StorePage extends StatelessWidget {
  static const String route = NavigationRouteNames.storePage;
  const StorePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      child: ListView.builder(
        itemCount: 100,
        itemBuilder: (context, index) => ListTile(
          title: Text(index.toString()),
        ),
      ),
    );
  }
}
