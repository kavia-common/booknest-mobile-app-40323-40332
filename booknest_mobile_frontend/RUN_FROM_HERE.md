# Run Flutter tools from this directory

This directory is the Flutter project root for the BookNest mobile app.

Examples:
- flutter pub get
- flutter analyze
- flutter test
- flutter run
- flutter build apk

CI from repo root (recommended helper scripts):
- bash ./run_flutter_analyze.sh
- bash ./run_flutter_tests.sh
- bash ./print_flutter_pubspec_path.sh

If a CI step reports:
"Could not determine project root directory for Flutter project"
ensure the working directory is set to:
booknest-mobile-app-40323-40332/booknest_mobile_frontend
or call the helper scripts from the repository root as shown above.
