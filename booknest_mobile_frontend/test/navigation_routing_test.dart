import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:booknest_mobile_frontend/core/routes.dart';
import 'package:booknest_mobile_frontend/screens/book_details_screen.dart';
import 'package:booknest_mobile_frontend/screens/home_screen.dart';

void main() {
  testWidgets('routes: / and /book/:id resolve correctly', (tester) async {
    final app = MaterialApp(
      onGenerateRoute: Routes.onGenerateRoute,
      initialRoute: Routes.root,
      routes: {
        Routes.root: (_) => const HomeScreen(),
      },
    );
    await tester.pumpWidget(app);
    expect(find.byType(HomeScreen), findsOneWidget);

    // Push /book/1
    final nav = tester.state<NavigatorState>(find.byType(Navigator));
    nav.pushNamed('/book/1');
    await tester.pumpAndSettle();

    expect(find.byType(BookDetailsScreen), findsOneWidget);
  });
}
