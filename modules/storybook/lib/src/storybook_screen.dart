import 'package:app_engine/app_engine.dart';
import 'package:app_mock_api/wiki_mock_api.dart';
import 'package:design_system/design_system.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:main/main.dart';
import 'package:onboarding/onboarding.dart';
import 'package:storybook_flutter/storybook_flutter.dart';
import 'package:ui/ui.dart';

import 'data_models.dart';

class StoryBookScreen extends StatefulWidget {
  static const routeName = '/story-book';

  const StoryBookScreen({
    Key? key,
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
        knobsSidePanel: false,
      ),
      wrapperBuilder: (ct, wid) {
        return MaterialApp(
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
        Story(
          name: 'Widgets/LogoWidget',
          builder: (_) => const LogoWidget(),
        ),
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
          builder: (_) => FutureBuilder<String>(
              future: TestHelper.loadString(
                  'packages/app_mock_api/assets/onboarding/sign_in.json'),
              builder: (context, snapshot) {
                if (snapshot.data?.isEmpty ?? true) {
                  return const SizedBox();
                }
                final dio = Dio();
                dio.httpClientAdapter = MockAdapter({
                  '/sign-in': snapshot.data!,
                });

                return BlocProvider<UserBloc>(
                  create: (context) => UserBloc()..add(LoadUserEvent(user)),
                  child: const DashboardScreen(),
                );
              }),
        ),
        Story(
          name: 'OnBoarding/SignInScreen',
          builder: (_) => FutureBuilder<String>(
            future: TestHelper.loadString(
                'packages/app_mock_api/assets/onboarding/sign_in.json'),
            builder: (context, snapshot) {
              final dio = Dio();
              dio.httpClientAdapter = MockAdapter({
                '/sign-in': snapshot.data!,
              });

              return BlocProvider<SignInBloc>(
                create: (context) => OnboardingFactory.createSignInBloc(
                  dio,
                  userBloc: UserBloc()..add(LoadUserEvent(user)),
                ),
                child: const SignInScreen(),
              );
            },
          ),
        ),
      ];
}
