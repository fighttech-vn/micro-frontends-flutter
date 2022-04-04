// Copyright 2021 Fighttech.vn, Ltd. All rights reserved.

part of '../theme.dart';

class ThemeColorDark extends ThemeColor {
  @override
  Color get primary => const Color(0xFFFA4169);
  @override
  Color get accent => const Color(0xFF1D1E2C);
  @override
  Color get scaffoldBackground => const Color(0xFF48484A);
  @override
  Color get background => const Color(0xFF201F1F);
  @override
  Color get backgroundSchema => const Color(0xFF0e0324);
  @override
  Color get primaryVariant => const Color(0xFF807E7E);

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
