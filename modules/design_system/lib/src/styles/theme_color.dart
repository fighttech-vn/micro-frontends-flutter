// Copyright 2021 Fighttech.vn, Ltd. All rights reserved.

part of 'theme.dart';

abstract class ThemeColor {
  Color get primary;
  Color get accent;
  Color get scaffoldBackground;
  Color get background;

  // BottomNavigationBar
  Color get bottomBarIconSelected;
  Color get bottomBarIconUnSelected;
  Color get bottomBarSelectedItemColor;
  Color get bottomBarUnselectedItemColor;

  //
  Color get appbarTitleColor;
}
