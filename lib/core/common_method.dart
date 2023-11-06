import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:frontend/core/constants.dart';
import 'package:frontend/core/styles/styles.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CommonMethod {
  CommonMethod._internal();

  static final CommonMethod _singleton = CommonMethod._internal();

  static CommonMethod get instance => _singleton;

  static void statusBarViewTheme() {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.dark.copyWith(
        // Color for Android
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.dark,
      ),
    );
  }

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width >= 800 && MediaQuery.of(context).size.width < 1200;

  static bool isDesktop(BuildContext context) =>
      (MediaQuery.of(context).size.width >= 1200 && MediaQuery.of(context).size.width < 1960) ||
      (isLargeDesktop(context)); // remaining testing for large desktop

  static bool isLargeDesktop(BuildContext context) => MediaQuery.of(context).size.width >= 1960;

  static bool isMobile(
    BuildContext context, {
    bool isWithoutMediaQuery = false,
  }) {
    final pixelRatio = View.of(context).devicePixelRatio;
    final logicalScreenSize = View.of(context).physicalSize / pixelRatio;

    return isWithoutMediaQuery
        ? (logicalScreenSize.width < 800)
        : (MediaQuery.of(context).size.width < 800);
  }

  Future<void> networkErrorMessage({
    required BuildContext context,
    Duration toastDuration = alertToastDuration,
  }) async {
    final toast = Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.black54,
        borderRadius: BorderRadius.circular(2),
      ),
      child: const Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.wifi,
            color: Colors.white,
          ),
          GymismoStyles.w8,
          Text(
            'You are currently offline.',
            maxLines: 5,
            style: GymismoStyles.tsWhiteBlinker14,
          ),
        ],
      ),
    );

    FToast().showToast(
      child: toast,
      toastDuration: toastDuration,
      gravity: kIsWeb ? ToastGravity.BOTTOM_RIGHT : ToastGravity.BOTTOM,
    );
  }

  bool isNotchDevice(BuildContext context) {
    //GlobalVariables.notchTopPadding = MediaQuery.of(context).padding.top;
    return MediaQuery.of(context).padding.top > 20;
  }
}
