// Copyright 2021 Fighttech.vn, Ltd. All rights reserved.

import 'dart:async';

import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:app_engine/app_engine.dart';
import 'package:flutter/material.dart';

import 'application.dart';

class AppDelegate {
  Future<void> run(Map<String, dynamic> env) async {
    WidgetsFlutterBinding.ensureInitialized();

    final savedThemeMode = await AdaptiveTheme.getThemeMode();

    runZonedGuarded(() {
      runApp(Application(
        savedThemeMode: savedThemeMode,
          userBloc: UserBloc(),
      ));
    }, (_, __) {});
  }
}
