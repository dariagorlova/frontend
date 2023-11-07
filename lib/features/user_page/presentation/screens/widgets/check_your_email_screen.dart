import 'package:flutter/material.dart';
import 'package:frontend/core/styles/images.dart';
import 'package:frontend/core/styles/styles.dart';

class CheckYourEmailScreen extends StatelessWidget {
  static const String route = '/check_email';

  const CheckYourEmailScreen({
    required this.email,
    required this.redirectToAuthScreen,
    required this.resendEmail,
    super.key,
  });

  final String email;
  final VoidCallback redirectToAuthScreen;
  final VoidCallback resendEmail;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Container(
          color: Colors.black,
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Container(
                alignment: Alignment.topCenter,
                height: MediaQuery.of(context).size.height * 0.2,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Icon(
                      Icons.arrow_back_ios_rounded,
                      color: Colors.transparent,
                      size: 20,
                    ),
                    InkWell(
                      onTap: redirectToAuthScreen,
                      child: const Icon(
                        Icons.clear,
                        color: Colors.white,
                        size: 20,
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.5,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 80,
                    ),
                    Image.asset(
                      GymismoImages.email,
                      width: 60,
                      height: 30,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    const Text(
                      'Check your email',
                      style: GymismoStyles.tsWhiteBlinker26w600,
                      textAlign: TextAlign.start,
                    ),
                    GymismoStyles.h24,
                    Text(
                      'We just sent the email to \n$email',
                      style: GymismoStyles.tsWhiteBlinker14w400,
                      textAlign: TextAlign.start,
                    ),
                    GymismoStyles.h24,
                    const Text(
                      'It has a magic link that’ll sign you into \n Gymismo',
                      style: GymismoStyles.tsWhiteBlinker14w400,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    InkWell(
                      onTap: resendEmail,
                      child: const Padding(
                        padding: EdgeInsets.all(5),
                        child: Text(
                          'I DIDN’T RECEIVE MY EMAIL',
                          style: GymismoStyles.tsWhiteBlinker14w400,
                          textAlign: TextAlign.start,
                        ),
                      ),
                    ),
                    GymismoStyles.h8,
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
