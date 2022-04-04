// Copyright 2021 Fighttech.vn, Ltd. All rights reserved.

import 'package:flutter/material.dart';

part 'colors/dark.dart';
part 'colors/light.dart';
part 'theme_color.dart';
part 'theme_decoration.dart';
part 'theme_display_metric.dart';
part 'theme_text.dart';

extension BrightnessExt on Brightness {
  ThemeColor getThemeColor() {
    return this == Brightness.light ? ThemeColorLight() : ThemeColorDark();
  }
}

extension ThemeDataExt on ThemeData {
  Brightness get themeMode => brightness;

  ThemeText get themeText => ThemeText();
  ThemeDecoration get themeDecoration => ThemeDecoration();
  ThemeColor get themeColor => themeMode.getThemeColor();
  ThemeDisplayMetric get themeDisplayMetric => ThemeDisplayMetric();

  ThemeData getTheme(Brightness theme) {
    final dataThemeColor = theme.getThemeColor();
    final textTheme = ThemeText();

    final kColorScheme = colorScheme.copyWith(
      primary: dataThemeColor.primary,
      brightness: theme,
    );

    return ThemeData(
      fontFamily: textTheme.bodyFont,
      brightness: theme,
      colorScheme: kColorScheme,
      backgroundColor: dataThemeColor.background,
      primaryColor: dataThemeColor.primary,
      scaffoldBackgroundColor: dataThemeColor.scaffoldBackground,
      bottomNavigationBarTheme: bottomNavigationBarTheme.copyWith(
        backgroundColor: dataThemeColor.background,
        elevation: 5,
        selectedItemColor: dataThemeColor.bottomBarSelectedItemColor,
        unselectedItemColor: dataThemeColor.bottomBarUnselectedItemColor,
        selectedIconTheme: bottomNavigationBarTheme.selectedIconTheme
            ?.copyWith(color: dataThemeColor.bottomBarIconSelected),
        unselectedIconTheme: bottomNavigationBarTheme.unselectedIconTheme
            ?.copyWith(color: dataThemeColor.bottomBarIconUnSelected),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          primary: const Color(0xFF007200),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(26)),
          ),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(26)),
          ),
          padding: EdgeInsets.zero,
          side: const BorderSide(width: 2, color: Colors.white),
        ),
      ),
      appBarTheme: AppBarTheme(
        titleTextStyle: TextStyle(
          fontStyle: FontStyle.normal,
        ),
        backgroundColor: dataThemeColor.primary
      ),
      inputDecorationTheme: InputDecorationTheme(
        isDense: true,
        contentPadding: const EdgeInsets.symmetric(
          vertical: 3,
          horizontal: 6,
        ),
        border: UnderlineInputBorder(
          borderSide: BorderSide(
            color: dataThemeColor.primary,
          ),
        ),
      ),
    );
  }
}
