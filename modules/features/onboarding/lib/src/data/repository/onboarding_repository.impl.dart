import 'package:app_core/app_core.dart';

import '../../domain/repository/onboarding_repository.dart';
import '../datasources/remote/onboarding_api.dart';

class OnBoardingRepositoryImpl extends OnBoardingRepository {
  final OnBoardingApi onBoardingApi;

  OnBoardingRepositoryImpl(this.onBoardingApi);

  @override
  Future<User> signIn(String email, String password) async {
    final result = await onBoardingApi.signIn();

    return result.results.first.toEntity();
  }
}
