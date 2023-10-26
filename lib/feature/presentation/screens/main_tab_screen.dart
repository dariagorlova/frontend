import 'package:flutter/material.dart';
import 'package:frontend/feature/presentation/screens/settings_screen.dart';

class MainTabScreen extends StatelessWidget {
  const MainTabScreen({
  required this.name,
  required this.email,
  required this.password,
  required this.referalCode,
  super.key});

  final String name;
  final String password;
  final String email;
  final String referalCode;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: ElevatedButton(
          onPressed: (){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (BuildContext ctx) => SettingsScreen(name: name, email: email, password: password, referalCode: referalCode),),
            );
          },
          child: const Text('SETTINGS'),
        ),
      ),
    );
  }
}
