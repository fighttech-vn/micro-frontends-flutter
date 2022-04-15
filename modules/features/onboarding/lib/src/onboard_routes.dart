import 'package:app_engine/app_engine.dart';
import 'package:core/core.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../onboarding.dart';
import 'presentation/sign_in/bloc/sign_in_bloc.dart';

class OnBoardingRoutes {
  static Map<String, WidgetBuilder> getAll(RouteSettings settings) => {
        SignInScreen.routeName: (context) {
          return BlocProvider<SignInBloc>(
            create: (context) => OnboardingFactory.createSignInBloc(
              Dio(
                BaseOptions(
                  baseUrl: 'https://randomuser.me/api/',
                  responseType: ResponseType.json,
                ),
              )..interceptors.add(LoggerInterceptor()),
              userBloc: BlocProvider.of<UserBloc>(context),
            ),
            child: const SignInScreen(),
          );
        },
      };
}
