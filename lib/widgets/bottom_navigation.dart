import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final surfaceColor = Theme.of(context).colorScheme.surface;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return SizedBox(
      height: 85,
      child: Stack(
        children: [
          Positioned(
            left: 12,
            right: 12,
            bottom: 12,
            child: Container(
              height: 65,
              decoration: BoxDecoration(
                color: surfaceColor,
                borderRadius: BorderRadius.circular(64),
                boxShadow: [
                  BoxShadow(
                    color: isDark ? AppTheme.ShadowColorDark : AppTheme.ShadowColorLight,
                    blurRadius: 20,
                  ),
                ],
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _BottomNavigationItem(
                    iconFileName: 'Home.png',
                    activeIconFileName: 'Home_Active.png',
                    label: 'Home'),
                  _BottomNavigationItem(
                    iconFileName: 'Article.png',
                    activeIconFileName: 'Article_Active.png',
                    label: 'Article'),
                  SizedBox(width: 12), // Space for the center button
                  _BottomNavigationItem(
                    iconFileName: 'Search.png',
                    activeIconFileName: 'Search_Active.png',
                    label: 'Search'),
                  _BottomNavigationItem(
                    iconFileName: 'Menu.png',
                    activeIconFileName: 'Menu_Active.png',
                    label: 'Menu')
                ],
              ),
            ),
          ),
          Center(
            child: Container(
              width: 65,
              height: 85,
              alignment: Alignment.topCenter,
              child: Container(
                height: 65,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(32.5),
                  color: Theme.of(context).colorScheme.primary,
                  border: Border.all(
                    color: surfaceColor,
                    width: 6,
                  ),
                ),
                child: Image.asset('assets/images/icons/add.png'),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class _BottomNavigationItem extends StatelessWidget {
  final String iconFileName;
  final String activeIconFileName;
  final String label;

  const _BottomNavigationItem({
    super.key,
    required this.iconFileName,
    required this.activeIconFileName,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    // Insert '_dark' before the file extension, e.g. 'Search.png' -> 'Search_dark.png'
    final resolvedFileName = isDark ? _withDarkSuffix(iconFileName) : iconFileName;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset('assets/images/icons/$resolvedFileName'),
        const SizedBox(height: 4),
        Text(
          label,
          style: Theme.of(context).textTheme.bodySmall,
        ),
      ],
    );
  }

  String _withDarkSuffix(String fileName) {
    final dotIndex = fileName.lastIndexOf('.');
    final name = fileName.substring(0, dotIndex);
    final extension = fileName.substring(dotIndex);
    return '${name}_dark$extension';
  }
}