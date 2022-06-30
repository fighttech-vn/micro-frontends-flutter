import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:app_core/app_core.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:localization/localization.dart';

import 'routes.dart';

class Application extends StatelessWidget {
  final UserBloc userBloc;
  final AdaptiveThemeMode? savedThemeMode;

  const Application({
    Key? key,
    this.savedThemeMode,
    required this.userBloc,
  }) : super(key: key);

  String get initialRoute {
    return 'sign-in';
  }

  List<BlocProvider> get _getProviders => [
        BlocProvider<UserBloc>(create: (BuildContext context) => userBloc),
      ];
  @override
  Widget build(BuildContext context) {
    final theme = ThemeData();

    return MultiBlocProvider(
      providers: _getProviders,
      child: AdaptiveTheme(
        light: theme.getTheme(Brightness.light),
        dark: theme.getTheme(Brightness.dark),
        initial: savedThemeMode ?? AdaptiveThemeMode.light,
        builder: (ThemeData light, ThemeData dark) =>
            buildMaterialApp(light: light, dark: dark),
      ),
    );
  }

  Widget buildMaterialApp({
    ThemeData? light,
    ThemeData? dark,
  }) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: light,
      darkTheme: dark,
      localizationsDelegates: LocalizationFactory.localizationsDelegates,
      supportedLocales: const [
        Locale('en', ''), // English, no country code
        Locale('es', ''), // Spanish, no country code
      ],
      locale: const Locale('en', ''),
      initialRoute: initialRoute,
      onGenerateRoute: Routes.generateRoute,
    );
  }
}
