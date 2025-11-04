import 'package:flutter/material.dart';

class AppTheme {
  // Dark Purple Colors
  // static const Color darkPurple = Color(0xFF4A148C);
  // static const Color mediumPurple = Color(0xFF6A1B9A);
  // static const Color lightPurple = Color(0xFF9C27B0);
  // static const Color veryLightPurple = Color(0xFFCE93D8);
  // static const Color palePurple = Color(0xFFE1BEE7);

  // static const Color darkPurple = Color(0xFF8B0000);
  static const Color darkPurple = Color(0xFF5E0101);
  static const Color mediumPurple = Color(0xFFC62828);
  static const Color lightPurple = Color(0xFFEF5350);
  static const Color veryLightPurple = Color(0xFFFFCDD2);
  static const Color palePurple = Color(0xFFFFEBEE);

  // Status Colors
  static const Color greenStatus = Color(0xFF4CAF50);
  static const Color amberStatus = Color(0xFFFF9800);
  static const Color redStatus = Color(0xFFF44336);

  // Gradient
  static LinearGradient purpleGradient = const LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      darkPurple,
      mediumPurple,
      lightPurple,
    ],
  );

  static LinearGradient lightPurpleGradient = const LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      lightPurple,
      veryLightPurple,
      palePurple,
    ],
  );

  static ThemeData lightTheme = ThemeData(
    primaryColor: darkPurple,
    scaffoldBackgroundColor: Colors.grey[50],
    colorScheme: const ColorScheme.light(
      primary: darkPurple,
      secondary: lightPurple,
      surface: Colors.white,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: darkPurple,
      elevation: 0,
      centerTitle: true,
      iconTheme: IconThemeData(color: Colors.white),
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: darkPurple,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        elevation: 4,
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.white,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: lightPurple),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: veryLightPurple),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: darkPurple, width: 2),
      ),
      prefixIconColor: lightPurple,
    ),
    cardTheme: CardTheme(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    ),
  );
}