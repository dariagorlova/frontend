import 'package:flutter/material.dart';

class ButtonBack extends StatelessWidget {
  const ButtonBack({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      width: MediaQuery.of(context).size.width,
      child: GestureDetector(
        onTap: () => Navigator.pop(context, 'back'),
        child: Container(
          height: 40,
          width: 40,
          alignment: Alignment.centerLeft,
          child: const Icon(
            Icons.arrow_back_ios_rounded,
            size: 20,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
