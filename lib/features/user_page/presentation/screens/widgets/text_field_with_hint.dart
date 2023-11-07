import 'package:flutter/material.dart';
import 'package:frontend/core/styles/colors.dart';
import 'package:frontend/core/styles/styles.dart';

class TextFieldWithHint extends StatelessWidget {
  const TextFieldWithHint({
    required this.controller,
    required this.hintText,
    required this.isObscure,
    required this.textInputType,
    required this.textCapitalization,
    super.key,
  });

  final TextEditingController controller;
  final String hintText;
  final bool isObscure;
  final TextInputType textInputType;
  final TextCapitalization textCapitalization;

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardAppearance: Brightness.dark,
      textCapitalization: textCapitalization,
      controller: controller,
      keyboardType: textInputType,
      cursorColor: Colors.white,
      obscureText: isObscure,
      style: GymismoStyles.tsWhiteBlinker14w400,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: GymismoStyles.tsFaintBlinker14w400,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: const BorderSide(
            color: GymismoColors.textFieldFocusBorder,
          ),
        ),
        filled: true,
        contentPadding: const EdgeInsets.all(10),
        fillColor: GymismoColors.mineshaft,
      ),
    );
  }
}
