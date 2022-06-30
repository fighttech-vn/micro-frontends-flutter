import 'package:app_core/app_core.dart';
import 'package:dio/dio.dart';

import '../data/datasources/remote/onboarding_api.dart';
import '../data/repository/onboarding_repository.impl.dart';
import '../domain/usecases/authentication_usecase.dart';
import 'sign_in/bloc/sign_in_bloc.dart';

class OnboardingFactory {
  static SignInBloc createSignInBloc(Dio dio, {required UserBloc userBloc}) {
    return SignInBloc(
      AuthenticationUsecase(
        OnBoardingRepositoryImpl(OnBoardingApi(dio)),
      ),
      userBloc,
    );
  }
}
