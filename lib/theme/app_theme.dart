import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  static const String defaultFontFamily = 'Avenir';
  static const Color seedColor = Color.fromARGB(255, 210, 178, 255);
  static const Color primaryTextColorLight = Colors.teal;
  static const Color secondaryTextColorLight = Colors.orangeAccent;
  static const Color thirdTextColorLight = Colors.black;

  static const Color primaryTextColorDark = Colors.orangeAccent;
  static const Color secondaryTextColorDark = Colors.teal;
  static const Color thirdTextColorDark = Colors.white;

  static ThemeData get lightTheme {
    return ThemeData(
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          textStyle: WidgetStateProperty.all(const TextStyle(
            fontFamily: defaultFontFamily,
            fontSize: 14,
            fontWeight: FontWeight.w700,
          )),
          foregroundColor: WidgetStateProperty.all(seedColor),
        )
      ),
      brightness: Brightness.light,
      colorScheme: ColorScheme.fromSeed(seedColor: seedColor),
      textTheme: _textThemeLight,
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          textStyle: WidgetStateProperty.all(const TextStyle(
            fontFamily: defaultFontFamily,
            fontSize: 14,
            fontWeight: FontWeight.w700,
          )),
          foregroundColor: WidgetStateProperty.all(seedColor),
        )
      ),
      brightness: Brightness.dark,
      colorScheme: ColorScheme.fromSeed(
        seedColor: seedColor,
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
      color: primaryTextColorLight,
    ),
    headlineMedium: TextStyle(
      fontFamily: defaultFontFamily,
      fontSize: 24,
      fontWeight: FontWeight.bold,
      color: thirdTextColorLight,
    ),
    titleMedium: TextStyle(
      fontFamily: defaultFontFamily,
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: primaryTextColorLight,
    ),
    titleSmall: TextStyle(
      fontFamily: defaultFontFamily,
      fontSize: 12,
      fontWeight: FontWeight.bold,
      color: secondaryTextColorLight,
    ),
    bodyLarge: TextStyle(
      fontFamily: defaultFontFamily,
      fontSize: 16,
      fontWeight: FontWeight.w400,
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
      color: thirdTextColorDark,
    ),
    titleMedium: TextStyle(
      fontFamily: defaultFontFamily,
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: primaryTextColorDark,
    ),
    titleSmall: TextStyle(
      fontFamily: defaultFontFamily,
      fontSize: 12,
      fontWeight: FontWeight.bold,
      color: secondaryTextColorDark,
    ),
    bodyLarge: TextStyle(
      fontFamily: defaultFontFamily,
      fontSize: 16,
      fontWeight: FontWeight.w400,
    ),
  );
}