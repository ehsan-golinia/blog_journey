import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  static const String defaultFontFamily = 'Avenir';
  static const Color primaryTextColorLight = Color(0xff0D253C);
  static const Color secondaryTextColorLight = Color(0xff2D4379);

  static const Color primaryTextColorDark = Colors.orangeAccent;
  static const Color secondaryTextColorDark = Colors.white;

  static ThemeData get lightTheme {
    return ThemeData(
      brightness: Brightness.light,
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      textTheme: _textThemeLight,
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      brightness: Brightness.dark,
      colorScheme: ColorScheme.fromSeed(
        seedColor: Colors.deepPurple,
        brightness: Brightness.dark,
      ),
      textTheme: _textThemeDark,
    );
  }

  static const TextTheme _textThemeLight = TextTheme(
    headlineSmall: TextStyle(
      fontFamily: defaultFontFamily,
      fontSize: 18,
      fontWeight: FontWeight.w200,
      color: secondaryTextColorLight,
    ),
    headlineMedium: TextStyle(
      fontFamily: defaultFontFamily,
      fontSize: 24,
      fontWeight: FontWeight.bold,
      color: primaryTextColorLight,
    ),
  );

  static const TextTheme _textThemeDark = TextTheme(
    headlineSmall: TextStyle(
      fontFamily: defaultFontFamily,
      fontSize: 18,
      fontWeight: FontWeight.w200,
      color: primaryTextColorDark,
    ),
    headlineMedium: TextStyle(
      fontFamily: defaultFontFamily,
      fontSize: 24,
      fontWeight: FontWeight.bold,
      color: secondaryTextColorDark,
    ),
  );
}