import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:localization/localization.dart';

import 'main/dashboard_screen.dart';

class Application extends StatelessWidget {
  final AdaptiveThemeMode? savedThemeMode;

  const Application({Key? key, this.savedThemeMode})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = ThemeData();
    return AdaptiveTheme(
      light: theme.getTheme(Brightness.light),
      dark: theme.getTheme(Brightness.dark),
      initial: savedThemeMode ?? AdaptiveThemeMode.light,
      builder: (ThemeData light, ThemeData dark) => buildMaterialApp(
        child: const DashboardScreen(),
        light: light,
        dark: dark,
      ),
    );
  }

  Widget buildMaterialApp({
    required Widget child,
    ThemeData? light,
    ThemeData? dark,
  }) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: light,
      darkTheme: dark,
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en', ''), // English, no country code
        Locale('es', ''), // Spanish, no country code
      ],
      locale: const Locale('en', ''),
      home: child,
    );
  }
}
