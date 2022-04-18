import 'package:app_engine/app_engine.dart';
import 'package:app_main/app_main.dart';
import 'package:design_system/design_system.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:localization/localization.dart';
import 'package:onboarding/onboarding.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

import 'material/flutter_logo_story.dart';
import 'material/scaffold_storybook.dart';

class StoryBookScreen extends StatefulWidget {
  static const routeName = '/story-book';

  final SharedPreferences sharedPreferences;
  final UserBloc userBloc;
  final Dio dio;
  final Map<String, dynamic> mockApiResponse;

  const StoryBookScreen({
    Key? key,
    required this.sharedPreferences,
    required this.userBloc,
    required this.dio,
    required this.mockApiResponse,
  }) : super(key: key);

  @override
  _StoryBookScreenState createState() => _StoryBookScreenState();
}

mixin StorybookBase {
  String get intStory;
  List<Story> getMaterialStory();
  List<Story> getWidgetsStory();
  List<Story> getScreenStory();

  List<Story> _getStories() => [
        ...getMaterialStory(),
        ...getWidgetsStory(),
        ...getScreenStory(),
      ];

  Widget buildStorybook() {
    return Storybook(
      plugins: initializePlugins(
        initialDeviceFrameData: DeviceFrameData(
          device: Devices.ios.iPhone13,
        ),
        contentsSidePanel: true,
        knobsSidePanel: true,
      ),
      wrapperBuilder: (ct, wid) {
        return MaterialApp(
          localizationsDelegates: LocalizationFactory.localizationsDelegates,
          theme: ThemeData().getTheme(Brightness.light),
          darkTheme: ThemeData().getTheme(Brightness.dark),
          debugShowCheckedModeBanner: false,
          useInheritedMediaQuery: true,
          home: Scaffold(body: Center(child: wid)),
        );
      },
      initialStory: intStory,
      stories: _getStories(),
    );
  }
}

class _StoryBookScreenState extends State<StoryBookScreen> with StorybookBase {
  Dio get dio => widget.dio;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildStorybook(),
    );
  }

  @override
  String get intStory => 'Widgets/LogoWidget';

  @override
  List<Story> getMaterialStory() => [
        Story(
          name: 'DesignSystem/Button',
          builder: (_) => Padding(
            padding: const EdgeInsets.only(top: 28.0),
            child: ElevatedButton(
              onPressed: () {},
              child: const Text('Click'),
            ),
          ),
        ),
        scaffoldStory,
        Story(
          name: 'DesignSystem/ButtonIcon',
          builder: (_) => Padding(
            padding: const EdgeInsets.only(top: 28.0),
            child: ElevatedButton(
              onPressed: () {},
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Icon(
                    Icons.search,
                    size: 16,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 4.0),
                    child: Text('Find the nearest allergist'),
                  ),
                ],
              ),
            ),
          ),
        ),
        Story(
          name: 'DesignSystem/TextField',
          builder: (_) => const Padding(
            padding: EdgeInsets.only(top: 28.0),
            child: TextField(),
          ),
        ),
      ];

  @override
  List<Story> getWidgetsStory() => [
        flutterLogoStory,
      ];

  @override
  List<Story> getScreenStory() => [
        Story(
          name: 'Screens/Empty',
          builder: (_) => Scaffold(
            appBar: AppBar(
              title: const Text('Empty screen'),
            ),
            body: const Center(child: Text('body')),
          ),
        ),
        Story(
          name: 'Screens/Dashboard',
          builder: (_) => const DashboardScreen(),
        ),
        Story(
          name: 'OnBoarding/SignInScreen',
          builder: (_) => BlocProvider<SignInBloc>(
            create: (context) => OnboardingFactory.createSignInBloc(
              dio,
              userBloc: widget.userBloc,
            ),
            child: const SignInScreen(),
          ),
        ),
      ];
}
