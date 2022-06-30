import 'dart:convert';

import 'package:app_mock_api/wiki_mock_api.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:onboarding/src/data/datasources/remote/onboarding_api.dart';
import 'package:onboarding/src/data/models/api_response.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late Dio dio;

  setUp(() {
    dio = Dio();
  });

  group('onboarding sign in with email and password', () {
    test('should verify correctly', () async {
      // Given
      final source = await TestHelper.loadString(
          'packages/wiki_mock_api/assets/onboarding/sign_in.json');
      dio.httpClientAdapter = MockAdapter({
        '/sign-in': source,
      });
      final onboardingApi = OnBoardingApi(dio, baseUrl: MockAdapter.mockBase);

      // When
      final result = await onboardingApi.signIn();

      // Then
      expect(
        result,
        equals(ApiResponse<dynamic>.fromJson(
            jsonDecode(source), (json) => json as dynamic)),
      );
    });
  });
}
