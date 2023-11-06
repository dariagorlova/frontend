import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:frontend/core/styles/styles.dart';

class GymismoToast {
  static final instance = GymismoToast._();
  GymismoToast._();
  late FToast _flutterToast;

  init(BuildContext globalContext) {
    _flutterToast = FToast();
    _flutterToast.init(globalContext);
  }

  void showToast(String? message, {int showTimeInSeconds = 4}) {
    if (message == null || message.isEmpty) {
      return;
    }
    final toast = Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.black54,
        borderRadius: BorderRadius.circular(2),
      ),
      child: Text(
        message,
        maxLines: 5,
        style: GymismoStyles.tsWhiteBlinker14,
      ),
    );

    FToast().showToast(
      child: toast,
      toastDuration: Duration(seconds: showTimeInSeconds),
      gravity: kIsWeb ? ToastGravity.BOTTOM_RIGHT : ToastGravity.BOTTOM,
    );
  }
}
