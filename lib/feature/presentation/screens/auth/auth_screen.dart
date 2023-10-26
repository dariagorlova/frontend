import 'package:flutter/material.dart';
import 'package:frontend/feature/presentation/screens/auth/login_screen.dart';
import 'package:frontend/feature/presentation/screens/auth/signup_screen.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            ElevatedButton(
              onPressed: () {
                // go to logIn
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext ctx) => const LoginScreen(),
                  ),
                );
              },
              child: const Text('LogIn'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                // go to sign up
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext ctx) => const SignUpScreen(),
                  ),
                );
              },
              child: const Text('SignUp'),
            ),
            const SizedBox(height: 60),
          ],
        ),
      ),
    );
  }
}
