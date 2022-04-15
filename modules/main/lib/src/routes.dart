import 'package:flutter/material.dart';
import 'package:onboarding/onboarding.dart';
import 'package:profile/profile.dart';

import '../main.dart';

class Routes {
  static Map<String, WidgetBuilder> _getAll(RouteSettings settings) => {
        ...OnBoardingRoutes.getAll(settings),
        ...ProfileRoutes.getAll(settings),
        DashboardScreen.routeName: (context) {
          return const DashboardScreen();
        },
      };

  static Route<dynamic> generateRoute(RouteSettings settings) {
    final _builder = _getAll(settings)[settings.name!]!;
    return MaterialPageRoute(
      builder: _builder,
      settings: settings,
      fullscreenDialog: false,
    );
  }
}
