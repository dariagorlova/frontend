import 'package:flutter/material.dart';
import 'package:frontend/core/services/toast_service.dart';
import 'package:frontend/core/styles/colors.dart';

class Utils {
  static GlobalKey<NavigatorState> mainNavigation = GlobalKey();
  static GlobalKey<NavigatorState> tabNavigation = GlobalKey();
  static GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  static void slideFromBottom(
    BuildContext context, {
    required Widget page,
    AnimationController? controller,
  }) {
    showModalBottomSheet<void>(
      barrierColor: GymismoColors.backgroundColor,
      context: context,
      useSafeArea: true,
      isDismissible: false,
      isScrollControlled: true,
      transitionAnimationController: controller,
      builder: (BuildContext context) {
        return page;
      },
    );
  }

  static void toastMessage(String? message, {int showTimeInSeconds = 4}) {
    GymismoToast.instance.showToast(message, showTimeInSeconds: showTimeInSeconds);
  }
}
