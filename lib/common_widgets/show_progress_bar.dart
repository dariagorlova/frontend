import 'package:flutter/material.dart';
import 'package:frontend/common_widgets/color_loader.dart';
import 'package:frontend/core/common_method.dart';

class ShowProgressBar extends StatelessWidget {
  const ShowProgressBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ColoredBox(
        color: Colors.transparent,
        child: Center(
          child: SizedBox(
            height: (CommonMethod.isTablet(context) || CommonMethod.isMobile(context))
                ? 150
                : MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: const ColorLoader3(),
          ),
        ),
      ),
    );
  }
}

class ShowProgressBarDialog extends StatelessWidget {
  const ShowProgressBarDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      alignment: Alignment.center,
      color: Colors.transparent,
      child: const Center(
        child: SizedBox(
          height: 40,
          width: 40,
          child: ColorLoader3(),
        ),
      ),
    );
  }
}
