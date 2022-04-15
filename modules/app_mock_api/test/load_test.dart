import 'dart:convert';

import 'package:app_mock_api/wiki_mock_api.dart';
import 'package:flutter_test/flutter_test.dart';


void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {});

  test('load assets bundle', () async {
    // When
    final source =
        await TestHelper.loadString('assets/onboarding/sign_in.json');
    final json = jsonDecode(source);

    // Then
    expect(json['s'] as int, 200);
  });

  test('load assets file', () async {
    // When
    final source =
        TestHelper.readJson('resources/api/v1/onboarding/sign_in.json');
    final json = jsonDecode(source);

    // Then
    expect(json['s'] as int, 200);
  });
}
