import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:ui/ui.dart';

void main() {
  testWidgets('Should render application support localized',
      (WidgetTester tester) async {
    // Given
    final app = LogoWidget();

    // When
    await tester.pumpWidget(MaterialApp(home: app));

    // Then
    expect(find.byType(FlutterLogo), findsOneWidget);
  });
}
