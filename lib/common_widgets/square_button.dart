import 'package:flutter/material.dart';
import 'package:frontend/core/styles/colors.dart';
import 'package:frontend/core/styles/styles.dart';

class SquareButton extends StatelessWidget {
  const SquareButton({
    required this.path,
    required this.text,
    required this.fun,
    super.key,
  });

  final String path;
  final String text;
  final VoidCallback fun;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: fun,
      mouseCursor: SystemMouseCursors.click,
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(5)),
          border: Border.all(
            color: GymismoColors.silver,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(path, width: 25, height: 25),
            GymismoStyles.w8,
            Text(
              text,
              style: GymismoStyles.tsGainsArchivo14,
            ),
          ],
        ),
      ),
    );
  }
}
