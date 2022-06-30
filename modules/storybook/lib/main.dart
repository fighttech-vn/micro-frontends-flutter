import 'package:app_core/app_core.dart';
import 'package:app_mock_api/wiki_mock_api.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'src/dummy_data_models.dart';
import 'src/preview_code_screen.dart';
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
  final userBloc = UserBloc()..add(LoadUserEvent(userDummy));

  final storybook = StoryBookScreen(
    sharedPreferences: sharedPreferences,
    userBloc: userBloc,
    dio: dio,
    mockApiResponse: mockApiResponse,
  );

  final previewCode = PreviewCodeScreen(
    sharedPreferences: sharedPreferences,
    storyBookScreen: storybook,
  );
  final isGanted = sharedPreferences.getBool(keyPreviewCode) ?? false;

  final app = MaterialApp(
    home: isGanted ? storybook : previewCode,
    onGenerateRoute: (settings) {
      if (settings.name == '/clear') {
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: FutureBuilder<bool>(
              future: sharedPreferences.clear(),
              builder: (context, ___) {
                return Column(
                  children: [
                    const Text('success'),
                    OutlinedButton(
                      onPressed: Navigator.of(context).pop,
                      child: const Text('OK'),
                    )
                  ],
                );
              },
            ),
          ),
        ); // Pass it to BarPage.
      }
      return null; // Let `onUnknownRoute` handle this behavior.
    },
  );
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider<UserBloc>(create: (BuildContext context) => userBloc),
    ],
    child: app,
  ));
}
