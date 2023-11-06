import 'package:flutter/material.dart';
import 'package:frontend/core/styles/colors.dart';
import 'package:frontend/core/styles/styles.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget({
    required this.controller,
    required this.hint,
    required this.textInputType,
    this.isPassword = false,
    super.key,
  });
  final TextEditingController controller;
  final bool isPassword;
  final String hint;
  final TextInputType textInputType;

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardAppearance: Brightness.dark,
      obscureText: isPassword,
      controller: controller,
      keyboardType: textInputType,
      cursorColor: GymismoColors.white,
      style: GymismoStyles.tsWhiteBlinker14,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: GymismoStyles.tsFaintBlinker14,
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
