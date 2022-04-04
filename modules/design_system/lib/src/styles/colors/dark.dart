// Copyright 2021 Fighttech.vn, Ltd. All rights reserved.

part of '../theme.dart';

class ThemeColorDark extends ThemeColor {
  @override
  Color get primary => Color.fromARGB(255, 237, 124, 11);
  @override
  Color get accent => const Color(0xFF1D1E2C);
  @override
  Color get scaffoldBackground => const Color(0xFF48484A);
  @override
  Color get background => const Color(0xFF201F1F);

  // Bottom Navigation Bar
  @override
  Color get bottomBarIconSelected => primary;
  @override
  Color get bottomBarIconUnSelected => const Color(0xFF9D9D9D);
  @override
  Color get bottomBarSelectedItemColor => primary;
  @override
  Color get bottomBarUnselectedItemColor => const Color(0xFF9D9D9D);
}
