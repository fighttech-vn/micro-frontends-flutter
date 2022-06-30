import 'package:app_core/app_core.dart';

import '../repository/onboarding_repository.dart';

class AuthenticationUsecase {
  final OnBoardingRepository _onBoardingRepository;

  AuthenticationUsecase(this._onBoardingRepository);

  Future<User> sinIn(String email, String password) async {
    final result = await _onBoardingRepository.signIn(email, password);

    return result;
  }

  Future<void> signUp(String email, String password) async {
    await _onBoardingRepository.signIn(email, password);
  }
}
