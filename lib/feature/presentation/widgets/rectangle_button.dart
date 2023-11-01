import 'package:flutter/material.dart';
import 'package:frontend/core/constants.dart';

class RectangleButton extends StatelessWidget {
  const RectangleButton({
    required this.text,
    this.fontSize = 18,
    this.textColor = defaultRectangleButtonTextColor,
    this.bgColor = defaultRectangleButtonColor,
    this.onClick,
    this.width,
    this.height,
    this.icon,
    this.iconColor,
    Key? key,
  }) : super(key: key);

  final String text;
  final double fontSize;
  final Color textColor;
  final Color bgColor;
  final VoidCallback? onClick;
  final double? width;
  final double? height;
  final IconData? icon;
  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick, // Handle your callback
      child: Container(
        height: height ?? 45,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: bgColor,
          border: Border.all(),
          borderRadius: const BorderRadius.all(Radius.circular(6)),
        ),
        width: width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (icon != null) ...[
              Icon(icon, color: iconColor ?? textColor),
              const SizedBox(
                width: 8,
              )
            ],
            Text(
              text,
              style: TextStyle(
                fontSize: fontSize,
                color: textColor,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
