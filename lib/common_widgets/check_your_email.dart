import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/features/user_page/presentation/bloc/user_cubit.dart';
import 'package:frontend/features/user_page/presentation/screens/auth_screen.dart';
import 'package:go_router/go_router.dart';

class CheckYourEmailScreen extends StatelessWidget {
  const CheckYourEmailScreen({required this.email, super.key});

  final String email;

  @override
  Widget build(BuildContext context) {
    const textColor = Colors.white;
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Container(
          color: Colors.black,
          padding: const EdgeInsets.only(
            left: 30,
            right: 30,
          ),
          child: Stack(
            children: [
              Column(
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
                          onTap: () {
                            GoRouter.of(context).go(AuthScreen.route);
                          },
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
                          'assets/images/email.png',
                          width: 60,
                          height: 30,
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        const Text(
                          'Check your email',
                          style: TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                            fontFamily: 'Blinker',
                          ),
                          textAlign: TextAlign.start,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          'We just sent the email to  ${'\n'}$email',
                          style: const TextStyle(
                            fontSize: 14,
                            color: textColor,
                            fontFamily: 'Blinker',
                            fontWeight: FontWeight.w400,
                          ),
                          textAlign: TextAlign.start,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Text(
                          'It has a magic link that’ll sign you into \n app',
                          style: TextStyle(
                            fontSize: 14,
                            color: textColor,
                            fontFamily: 'Blinker',
                            fontWeight: FontWeight.w400,
                          ),
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
                          onTap: () {
                            //_callResendMailApi(context);
                            context.read<UserCubit>().resendVerificationEmail(email);
                          }, // Handle your callback
                          child: const Padding(
                            padding: EdgeInsets.all(5),
                            child: Text(
                              'I DIDN’T RECEIVE MY EMAIL',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: textColor,
                                fontFamily: 'Blinker',
                              ),
                              textAlign: TextAlign.start,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              //if (isLoading) const ShowProgressBar()
            ],
          ),
        ),
      ),
    );
  }
}
