import 'package:storybook_flutter/storybook_flutter.dart';
import 'package:ui/ui.dart';

Story get flutterLogoStory => Story(
      name: 'Widgets/LogoWidget',
      builder: (context) => LogoWidget(
        size: context.knobs.nullable.slider(
              label: 'Logo Flutter Image',
              initial: 40,
              min: 20,
              max: 700,
              description: 'Logo Flutter image',
            ) ??
            72,
      ),
    );
