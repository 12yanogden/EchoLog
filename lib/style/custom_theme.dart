import 'package:flutter/material.dart';

import 'custom_colors.dart';

class CustomTheme {
  static ThemeData get lightTheme {
    return ThemeData(
        primaryColor: primaryColor,
        scaffoldBackgroundColor: offWhite,
        fontFamily: 'Comfortaa');
  }
}
