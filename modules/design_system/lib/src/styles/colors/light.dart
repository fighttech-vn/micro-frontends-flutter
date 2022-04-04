// Copyright 2021 Fighttech.vn, Ltd. All rights reserved.

part of '../theme.dart';

class ThemeColorLight extends ThemeColor {
  @override
  Color get primary => Color.fromARGB(255, 223, 118, 5);
  @override
  Color get accent => const Color(0xFFFB6107);
  @override
  Color get scaffoldBackground => const Color(0xFFE9E9E9);
  @override
  Color get background => const Color(0xFFFFFFFF);

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
