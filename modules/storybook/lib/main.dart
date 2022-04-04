import 'package:flutter/material.dart';
import 'package:main/main.dart';

import 'src/storybook_screen.dart';

void main() {
  runApp(const Application().buildMaterialApp(
      child: StoryBookScreen(), dark: ThemeData(), light: ThemeData()));
}
