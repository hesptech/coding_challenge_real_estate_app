import 'package:flutter/material.dart';

class AppTheme {

  AppTheme();
  
  ThemeData getTheme() => ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: const Color(0xFFF6F7F9),
    brightness: Brightness.light,
    colorScheme: const ColorScheme(
      brightness: Brightness.light,
      primary: Colors.black,
      onPrimary: Colors.white,
      secondary: Colors.white,
      onSecondary: Colors.black,
      error: Colors.red,
      onError: Colors.white,
      background: Colors.white,
      onBackground: Colors.black,
      surface: Colors.white,
      onSurface: Colors.black,
    ),
  );
}