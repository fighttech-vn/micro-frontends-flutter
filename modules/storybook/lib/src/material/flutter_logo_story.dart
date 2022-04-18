import 'package:storybook_flutter/storybook_flutter.dart';
import 'package:ui/ui.dart';

Story get flutterLogoStory => Story(
      name: 'Widgets/LogoWidget',
      builder: (context) =>  LogoWidget(
        size: context.knobs.nullable.slider(
          label: 'AppBar elevation',
          initial: 4,
          min: 0,
          max: 10,
          description: 'Elevation of the app bar.',
        ) ?? 25,
      ),
    );
