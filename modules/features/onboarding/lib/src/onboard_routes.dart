import 'package:app_core/app_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../onboarding.dart';

class OnBoardingRoutes {
  static Map<String, WidgetBuilder> getAll(RouteSettings settings) => {
        SignInScreen.routeName: (context) {
          return BlocProvider<SignInBloc>(
            create: (context) => OnboardingFactory.createSignInBloc(
              AppCoreFactory.createDio(),
              userBloc: BlocProvider.of<UserBloc>(context),
            ),
            child: const SignInScreen(),
          );
        },
      };
}
