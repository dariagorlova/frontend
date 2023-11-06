import 'package:flutter/material.dart';

class StorePage extends StatelessWidget {
  static const String route = '/store';
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
