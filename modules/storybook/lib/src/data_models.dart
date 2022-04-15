import 'package:app_engine/app_engine.dart';
import 'package:app_mock_api/wiki_mock_api.dart';

final responseSignIn = TestHelper.loadString(
    'packages/wiki_mock_api/assets/onboarding/sign_in.json');

const user = User(email: 'email@gmail.com', gender: '');
