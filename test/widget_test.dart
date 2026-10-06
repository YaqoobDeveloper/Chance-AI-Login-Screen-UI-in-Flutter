import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:chance_login_screen/main.dart';

void main() {
  testWidgets('signing in with Apple opens the home page', (tester) async {
    // iPhone-sized screen (390 × 844).
    tester.view
      ..physicalSize = const Size(1170, 2532)
      ..devicePixelRatio = 3;
    addTearDown(tester.view.reset);

    await tester.pumpWidget(const MyApp());

    expect(find.text('Chance.'), findsWidgets);
    expect(find.text('Continue with Google'), findsOneWidget);

    await tester.tap(find.text('Continue with Apple'));
    await tester.pump(const Duration(seconds: 2)); // fake network delay
    await tester.pumpAndSettle();

    expect(find.text('Welcome, Chance User'), findsOneWidget);
    expect(find.text('Signed in with apple'), findsOneWidget);
  });
}
