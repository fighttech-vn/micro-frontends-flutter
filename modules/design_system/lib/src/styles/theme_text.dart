// Copyright 2021 Fighttech.vn, Ltd. All rights reserved.

// ignore_for_file: unused_field

part of 'theme.dart';

class ThemeText {
  final ThemeColor _themeColor;
  ThemeText(this._themeColor);

  String titleFont = 'Comfortaa';
  String bodyFont = 'Noto Sans';

  TextTheme get getTextTheme => const TextTheme(
        headline2: TextStyle(
          fontSize: 16,
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.w700,
        ),
      );
}
