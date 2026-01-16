// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';

class ColorResources {
  static const gradientColor1 = Color(0xFF2E75B5);
  static const gradientColor2 = Color(0xFF7FAAD0);
  static const gradientColor3 = Color(0xFFD2E3F2);
  static const gradientColor4 = Color(0xFFFFFFFF);

  static const primaryGradient = LinearGradient(
    colors: [gradientColor1, gradientColor2, gradientColor3, gradientColor4],
    // begin: Alignment.topLeft,
    // end: Alignment.bottomRight,
  );

  static const primary = Color(0XFF3A725E);
  static final secondary = const Color(0xFF3A725E).withOpacity(0.6);
  static const textColor = Color(0xFF000000);
  static const white = Color(0xFFFFFFFF);
  static const scaffoldBackground = Color(0xFFFFFFFF);
  static const black = Color(0xFF000000);
  static const grey = Color(0xFF979797);
  static const borderColor = Color(0xFFE4EBFF);
  static const primaryShadow = Color(0xFF70A2CF);
  static const secondaryShadow = Color(0xFF616161);
  static const dividerColor = Color(0xFFA4B6DD);
  static const textFieldBorderColor = Color(0xFFD8D8D8);
  static const textFieldColor = Color(0xFFFBFBFB);
  static const green = Color(0xFF00B72E);
  static const red = Color(0xFFFF383C);
  static const lightGray = Color(0xFFD9D9D9);
  static const transparent = Colors.transparent;
}
