import 'package:flutter_test/flutter_test.dart';
import 'package:booknest_mobile_frontend/main.dart' as app;

void main() {
  test('package import resolves', () {
    // Simply reference a symbol from the app to ensure package resolution works.
    expect(app.BookNestApp, isNotNull);
  });
}
