import 'package:app_engine/app_engine.dart';

abstract class OnBoardingRepository {
  Future<User> signIn(String email, String password);
}
