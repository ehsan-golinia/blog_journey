import 'package:flutter/material.dart';

final ValueNotifier<ThemeMode> themeModeNotifier = ValueNotifier(ThemeMode.light);

void toggleTheme() {
  themeModeNotifier.value =
      themeModeNotifier.value == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
}