import 'package:flutter/material.dart';
import 'package:frontend/mobile_app.dart';
import 'package:frontend/service_locator.dart' as di;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.initDI();
  // device id
  runApp(const MobileApp());
}
