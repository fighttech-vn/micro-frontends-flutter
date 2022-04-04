// Copyright 2021 Fighttech.vn, Ltd. All rights reserved.

part of 'theme.dart';

class ThemeText {
  ThemeText();

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
