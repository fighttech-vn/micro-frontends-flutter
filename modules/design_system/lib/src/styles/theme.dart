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
  ThemeColor get themeColor => brightness.getThemeColor();
  ThemeDecoration get themeDecoration => const ThemeDecoration();
  ThemeDisplayMetric get themeDisplayMetric => const ThemeDisplayMetric();

  ThemeData getTheme(Brightness theme) {
    final dataThemeColor = theme.getThemeColor();

    return ThemeData(
      fontFamily: ThemeText().bodyFont,
      brightness: theme,
      colorScheme: colorScheme.copyWith(
        primary: dataThemeColor.primary,
        brightness: theme,
      ),
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
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          minimumSize: const Size.fromHeight(40),
          padding: EdgeInsets.zero,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6),
          ),
        ),
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
          color: themeColor.appbarTitleColor,
        ),
        backgroundColor: dataThemeColor.primary,
      ),
      inputDecorationTheme: InputDecorationTheme(
        isDense: true,
        contentPadding: const EdgeInsets.symmetric(
          vertical: 11,
          horizontal: 10,
        ),
        filled: true,
        fillColor: dataThemeColor.background,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
