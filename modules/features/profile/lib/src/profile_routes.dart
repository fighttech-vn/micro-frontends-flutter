import 'package:flutter/material.dart';

import 'presentation/edit_profile/views/edit_profile_screen.dart';

class ProfileRoutes {
  static Map<String, WidgetBuilder> getAll(RouteSettings settings) => {
        EditProfileScreen.routeName: (context) {
          return const EditProfileScreen();
        },
       
      };
}
