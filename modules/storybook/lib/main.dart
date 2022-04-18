import 'package:app_engine/app_engine.dart';
import 'package:app_mock_api/wiki_mock_api.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'src/storybook_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Local database
  final sharedPreferences = await SharedPreferences.getInstance();

  // Remote datasource
  final mockApiResponse = {
    '/sign-in': await TestHelper.loadString(
        'packages/app_mock_api/assets/onboarding/post_sign_in.json'),
  };

  final dio = Dio()..httpClientAdapter = MockAdapter(mockApiResponse);
  final userBloc = UserBloc();

  final app = MaterialApp(
    home: StoryBookScreen(
      sharedPreferences: sharedPreferences,
      userBloc: userBloc,
      dio: dio,
      mockApiResponse: mockApiResponse,
    ),
  );

  runApp(MultiBlocProvider(
    providers: [
      BlocProvider<UserBloc>(create: (BuildContext context) => userBloc),
    ],
    child: app,
  ));
}
