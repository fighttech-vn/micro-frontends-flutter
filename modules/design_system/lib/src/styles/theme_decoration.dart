// Copyright 2021 Fighttech.vn, Ltd. All rights reserved.

part of 'theme.dart';

class ThemeDecoration {
  const ThemeDecoration();

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
