import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:localization/localization.dart';

void main() {
  testWidgets('Should render application support localized',
      (WidgetTester tester) async {
    // Given
    final app = MaterialApp(
      title: 'Flutter Demo',
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en', ''), // English, no country code
        Locale('es', ''), // Spanish, no country code
      ],
      locale: const Locale('en', ''),
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: Scaffold(
        body: Center(
          child: Builder(builder: (context) {
            return Text(S.of(context).helloWorld);
          }),
        ),
      ),
    );

    // When
    await tester.pumpWidget(app);
    await tester.pumpAndSettle();

    // Then
    expect(find.text('Hello World! - EN'), findsOneWidget);
  });
}
