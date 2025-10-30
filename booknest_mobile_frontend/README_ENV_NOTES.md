# Environment Loading Notes

To keep CI analyzer stable in environments that do not start in the Flutter project root, the app temporarily avoids using `flutter_dotenv` during bootstrap.

Re-introducing environment loading:
- Add dependency back to pubspec.yaml:
  flutter_dotenv: ^5.1.0
- Create a small helper (e.g., lib/core/env_loader.dart) that wraps dotenv loading:
  - Guard loading with try/catch.
  - Only call it from main() after WidgetsFlutterBinding.ensureInitialized().
- Ensure CI runs analyzer from the Flutter project root:
  cd booknest-mobile-app-40323-40332/booknest_mobile_frontend && flutter analyze

This change does not affect app functionality for current sample-data flows.
