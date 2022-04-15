import 'package:app_engine/app_engine.dart';
import 'package:flutter/material.dart';
import 'package:main/main.dart';

import 'src/storybook_screen.dart';

void main() {
  final application = Application(userBloc: UserBloc());

  runApp(MaterialApp(
    localizationsDelegates: application.localizationsDelegates,
    home: const StoryBookScreen(),
  ));
}
