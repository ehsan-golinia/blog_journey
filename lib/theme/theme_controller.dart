import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

final ValueNotifier<ThemeMode> themeModeNotifier = ValueNotifier(ThemeMode.light);

void toggleTheme() {
  final isDark = themeModeNotifier.value == ThemeMode.light;
  themeModeNotifier.value = isDark ? ThemeMode.dark : ThemeMode.light;

  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: isDark
        ? ThemeData.dark().colorScheme.surface
        : ThemeData.light().colorScheme.surface,
    statusBarIconBrightness: isDark ? Brightness.light : Brightness.dark,
    systemNavigationBarColor: isDark
        ? ThemeData.dark().colorScheme.surface
        : ThemeData.light().colorScheme.surface,
    systemNavigationBarIconBrightness: isDark ? Brightness.light : Brightness.dark,
  ));
}