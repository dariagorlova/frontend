import 'package:flutter/material.dart';
import 'package:frontend/core/styles/colors.dart';

class GymismoStyles {
  // here we have all of app styles and sizes in one place

  static const h8 = SizedBox(height: 8);
  static const h16 = SizedBox(height: 16);
  static const h24 = SizedBox(height: 24);
  static const h32 = SizedBox(height: 32);
  static const h40 = SizedBox(height: 40);
  static const h68 = SizedBox(height: 68);

  static const w8 = SizedBox(width: 8);
  static const w16 = SizedBox(width: 16);
  static const w24 = SizedBox(width: 24);
  static const w32 = SizedBox(width: 32);
  static const w40 = SizedBox(width: 40);

  // for paddings
  static const double spacingExtraSmall = 8;
  static const double spacingSmall = 16;
  static const double spacingMedium = 24;
  static const double spacingLarge = 32;
  static const double spacingExtraLarge = 40;
  static const double spacingMega = 48;

  // -- TEXT STYLE --
  static const tsWhiteArchivo14 = TextStyle(
    color: Colors.white,
    fontFamily: 'Archivo',
    fontWeight: FontWeight.w400,
    fontSize: 14,
  );

  static const tsGainsArchivo12 = TextStyle(
    fontSize: 12,
    color: GymismoColors.gainsBoro,
    fontFamily: 'Archivo',
  );

  static const tsTextFieldBorderArchivo12 = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: GymismoColors.textFieldFocusBorder,
    fontFamily: 'Archivo',
  );

  static const tsGainsArchivo14 = TextStyle(
    color: GymismoColors.gainsBoro,
    fontWeight: FontWeight.w400,
    fontFamily: 'Archivo',
    fontSize: 12,
  );

  static const tsGreyTextArchivo10 = TextStyle(
    height: 1.3,
    fontWeight: FontWeight.w400,
    fontFamily: 'Archivo',
    color: GymismoColors.grayText_2,
    fontSize: 10,
  );

  static const tsSilverArchivo12 = TextStyle(
    fontSize: 12,
    color: GymismoColors.silver,
    fontFamily: 'Archivo',
    height: 1.5,
  );

  static const tsWhiteBlinker12 = TextStyle(
    fontSize: 12,
    color: Colors.white,
    letterSpacing: 0.5,
    fontWeight: FontWeight.w600,
    fontFamily: 'Blinker',
  );

  static const tsWhiteBlinker26 = TextStyle(
    fontSize: 26,
    fontWeight: FontWeight.w600,
    color: Colors.white,
    fontFamily: 'Blinker',
  );

  static const tsFaintBlinker12 = TextStyle(
    fontSize: 12,
    color: GymismoColors.faint,
    fontFamily: 'Blinker',
    letterSpacing: 0.35,
    fontWeight: FontWeight.w400,
  );

  static const tsWhiteBlinker14 = TextStyle(
    fontSize: 14,
    color: Colors.white,
    letterSpacing: 0.35,
    fontFamily: 'Blinker',
  );
  static const tsWhiteBlinker14w400 = TextStyle(
    fontSize: 14,
    color: Colors.white,
    fontWeight: FontWeight.w400,
    fontFamily: 'Blinker',
  );

  static const tsFaintBlinker14 = TextStyle(
    fontSize: 14,
    color: GymismoColors.faint,
    letterSpacing: 0.35,
    fontFamily: 'Blinker',
  );

  static const tsSilverBlinker18 = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: GymismoColors.silver,
    fontFamily: 'Blinker',
  );
}
