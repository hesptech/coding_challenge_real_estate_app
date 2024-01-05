import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {

  static const kPrimaryColor = Color(0xFF38B4BC);
  static const kOnPrimary = Colors.white;
  static const kSecondaryColor = Color(0xFFF3A317);
  static const kTxtLightGreyColor = Color(0xFF8F8F8F);
  static const kBgGreyColor = Color(0xFFF6F7F9);
  static const kOnBackgroundColor = Colors.black;


  AppTheme();

  ThemeData getTheme() => ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: kBgGreyColor,
    fontFamily: GoogleFonts.poppins().fontFamily,
    brightness: Brightness.light,
    colorScheme: const ColorScheme(
      brightness: Brightness.light,
      primary: kPrimaryColor,
      onPrimary: kOnPrimary,
      secondary: kSecondaryColor,
      onSecondary: Colors.black,
      error: Colors.red,
      onError: Colors.white,
      background: Colors.white,
      onBackground: Colors.black,
      surface: Colors.white,
      onSurface: Colors.black,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: kBgGreyColor
    ),
    inputDecorationTheme: const InputDecorationTheme(
      border: InputBorder.none,
      hintStyle: TextStyle(color: kTxtLightGreyColor),
      fillColor: kOnPrimary,
    ),
    /* searchBarTheme: const SearchBarThemeData(
      backgroundColor: MaterialStatePropertyAll<Color>(kOnPrimary),

    ) */
  );
}