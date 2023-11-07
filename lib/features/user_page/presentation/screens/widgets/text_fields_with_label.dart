import 'package:flutter/material.dart';
import 'package:frontend/core/styles/styles.dart';
import 'package:frontend/features/user_page/presentation/screens/widgets/text_field_with_hint.dart';

// ignore: must_be_immutable
class TextFieldsWithLabel extends StatelessWidget {
  TextFieldsWithLabel(
      {required this.controller,
      required this.hintText,
      required this.title,
      required this.textInputType,
      required this.isObscure,
      this.controller2,
      this.hintText2,
      super.key});

  final TextEditingController controller;
  TextEditingController? controller2;
  final String hintText;
  String? hintText2;
  final String title;
  final TextInputType textInputType;
  final bool isObscure;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: GymismoStyles.tsFaintBlinker12w400,
          textAlign: TextAlign.start,
        ),
        GymismoStyles.h8,
        controller2 == null || hintText2 == null
            ? TextFieldWithHint(
                controller: controller,
                hintText: hintText,
                isObscure: isObscure,
                textInputType: textInputType,
                textCapitalization: TextCapitalization.none,
              )
            : Row(
                children: [
                  Flexible(
                    child: TextFieldWithHint(
                      controller: controller,
                      hintText: hintText,
                      isObscure: isObscure,
                      textInputType: textInputType,
                      textCapitalization: TextCapitalization.sentences,
                    ),
                  ),
                  GymismoStyles.w8,
                  Flexible(
                    child: TextFieldWithHint(
                      controller: controller2!,
                      hintText: hintText2!,
                      isObscure: isObscure,
                      textInputType: textInputType,
                      textCapitalization: TextCapitalization.sentences,
                    ),
                  ),
                ],
              ),
      ],
    );
  }
}
