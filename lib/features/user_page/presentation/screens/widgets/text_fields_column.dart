import 'package:flutter/material.dart';
import 'package:frontend/core/styles/colors.dart';
import 'package:frontend/core/styles/styles.dart';
import 'package:frontend/features/user_page/presentation/screens/widgets/text_fields_with_label.dart';

class TextFieldsColumn extends StatelessWidget {
  const TextFieldsColumn(
      {required this.controllerEmail,
      required this.controllerPassword,
      required this.controllerName,
      required this.controllerLastName,
      required this.controllerRefCode,
      super.key});

  final TextEditingController controllerEmail;
  final TextEditingController controllerPassword;
  final TextEditingController controllerName;
  final TextEditingController controllerLastName;
  final TextEditingController controllerRefCode;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        // name & lastName
        TextFieldsWithLabel(
          controller: controllerName,
          controller2: controllerLastName,
          hintText: 'Enter first name',
          hintText2: 'Enter last name',
          title: 'Name',
          textInputType: TextInputType.text,
          isObscure: false,
        ),
        GymismoStyles.h16,

        // email
        TextFieldsWithLabel(
          controller: controllerEmail,
          hintText: 'Enter email',
          title: 'Email',
          textInputType: TextInputType.emailAddress,
          isObscure: false,
        ),
        GymismoStyles.h16,

        //password
        TextFieldsWithLabel(
          controller: controllerPassword,
          hintText: 'Enter password',
          title: 'Password',
          textInputType: TextInputType.text,
          isObscure: true,
        ),
        GymismoStyles.h16,

        // referral code
        TextFieldsWithLabel(
          controller: controllerRefCode,
          hintText: 'Enter your referral code (optional)',
          title: 'Referral Code',
          textInputType: TextInputType.text,
          isObscure: false,
        ),
        GymismoStyles.h8,
        const Row(
          children: [
            Icon(
              Icons.info_outline,
              color: GymismoColors.faint,
              weight: 20,
            ),
            GymismoStyles.w8,
            Expanded(
              child: Text(
                'Use a minimum of 8 characters (case sensitive) with at least one upper case letter, one number and one special character.',
                style: GymismoStyles.tsFaintBlinker12w400,
                textAlign: TextAlign.start,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
