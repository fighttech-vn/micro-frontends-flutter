import 'package:app_core/app_core.dart';

abstract class OnBoardingRepository {
  Future<User> signIn(String email, String password);
}
