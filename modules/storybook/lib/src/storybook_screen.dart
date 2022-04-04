import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:main/main.dart';
import 'package:ui/ui.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

class StoryBookScreen extends StatefulWidget {
  static const routeName = '/story-book';

  const StoryBookScreen({Key? key}) : super(key: key);

  @override
  _StoryBookScreenState createState() => _StoryBookScreenState();
}

class _StoryBookScreenState extends State<StoryBookScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
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

  List<Story> _getStories() => [
        ..._getMaterialStory(),
        ..._getWidgetsStory(),
        ..._getScreenStory(),
      ];

  String get intStory => 'Widgets/LogoWidget';

  List<Story> _getWidgetsStory() => [
        Story(
          name: 'Widgets/LogoWidget',
          builder: (_) => LogoWidget(),
        ),
      ];

  List<Story> _getScreenStory() => [
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
          builder: (_) => Builder(builder: (context) {
            return DashboardScreen();
          }),
        ),
      ];

  List<Story> _getMaterialStory() => [
        Story(
          name: 'DesignSystem/Button',
          builder: (_) => Padding(
            padding: EdgeInsets.only(top: 28.0),
            child: ElevatedButton(
              onPressed: () {},
              child: Text('Click'),
            ),
          ),
        ),
        Story(
          name: 'DesignSystem/TextField',
          builder: (_) => Padding(
            padding: EdgeInsets.only(top: 28.0),
            child: TextField(),
          ),
        ),
      ];
}
