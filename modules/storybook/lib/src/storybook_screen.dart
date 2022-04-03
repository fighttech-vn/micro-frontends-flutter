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
      initialStory: 'Widgets/LogoWidget',
      stories: _getStories(),
    );
  }

  List<Story> _getStories() {
    return [
      Story(
        name: 'Widgets/LogoWidget',
        builder: (_) => LogoWidget(),
      ),
      // Story(
      //   name: 'Widgets/OTP Widget',
      //   description: 'OTP Widget',
      //   builder: (_) => Padding(
      //     padding: const EdgeInsets.only(top: 28.0),
      //     child: OtpWidgetExampleBuilder(),
      //   ),
      // ),

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
              })),
    ];
  }
}
