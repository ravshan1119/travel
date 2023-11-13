import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:travel/src/config/router/go_router.dart';
import 'package:travel/src/config/themes/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return AdaptiveTheme(
        light: AppTheme.lightTheme,
        dark: AppTheme.darkTheme,
        initial: AdaptiveThemeMode.system,
        builder: (theme, darkTheme) {
          return MaterialApp.router(
            routerConfig: router,
            debugShowCheckedModeBanner: false,
            theme: theme,
            darkTheme: darkTheme,
          );
        });
  }
}
