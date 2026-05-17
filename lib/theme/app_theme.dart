import 'package:flutter/material.dart';

class AppTheme {
  static const Color primaryColor = Color(0xffFF6B00);

  static const Color darkColor = Color(0xff121212);

  static const Color lightColor = Color(0xffF5F5F5);

  static ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: darkColor,

    primaryColor: primaryColor,

    colorScheme: ColorScheme.dark(primary: primaryColor),

    appBarTheme: const AppBarTheme(backgroundColor: darkColor, elevation: 0),

    textTheme: const TextTheme(bodyMedium: TextStyle(color: Colors.white)),
  );
}
