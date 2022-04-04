// Copyright 2021 Fighttech.vn, Ltd. All rights reserved.

// ignore_for_file: unused_field

part of 'theme.dart';

class ThemeDecoration {
  final ThemeColor _themeColor;
  const ThemeDecoration(this._themeColor);

  BoxDecoration get appBarGradient => BoxDecoration();

  BoxDecoration textShadow(BuildContext context) => BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.centerRight,
          end: Alignment.centerLeft,
          colors: [
            Theme.of(context).backgroundColor,
            Colors.white.withOpacity(0.2),
          ],
        ),
      );

}
