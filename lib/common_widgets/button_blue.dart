import 'package:flutter/material.dart';
import 'package:frontend/core/styles/colors.dart';

class ButtonBlue extends StatelessWidget {
// with UnlimitedClickMixin {
  const ButtonBlue({
    required this.onClick,
    required this.text,
    this.width,
    this.fontSize = 18,
    this.height = 45,
    this.color = GymismoColors.textFieldFocusBorder,
    super.key,
  });

  final VoidCallback onClick;
  final String text;
  final double? width;
  final double fontSize;
  final Color color;
  final double height;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick,
      child: Container(
        height: height,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: color,
          borderRadius: const BorderRadius.all(Radius.circular(2)),
        ),
        width: width,
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: fontSize, //ResizeScreen.getFontSizeFromPixel(context, fontSize),
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontFamily: 'Blinker',
          ),
        ),
      ),
    );
  }
}
