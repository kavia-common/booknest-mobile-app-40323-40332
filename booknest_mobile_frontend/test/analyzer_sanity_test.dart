import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('sanity: can build a minimal MaterialApp', (tester) async {
    await tester.pumpWidget(const MaterialApp(home: Scaffold(body: Text('OK'))));
    expect(find.text('OK'), findsOneWidget);
  });
}
