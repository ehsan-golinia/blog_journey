import 'package:flutter/material.dart';
import 'pages/pages.dart';
import 'theme/app_theme.dart';
import 'theme/theme_controller.dart';
import 'widgets/widgets.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
      valueListenable: themeModeNotifier,
      builder: (context, themeMode, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Blog Journey',
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode: themeMode,
          home: Stack(
            children: [
              const Positioned.fill(child: const HomeScreen()),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: const BottomNavigation()),
            ],
          ),
        );
      },
    );
  }
}

