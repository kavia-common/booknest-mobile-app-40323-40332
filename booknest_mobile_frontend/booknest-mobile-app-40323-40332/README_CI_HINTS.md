# CI/Analyzer Hints

The Flutter project root is located at:
booknest-mobile-app-40323-40332/booknest_mobile_frontend

In CI, set the working directory to the path above before running:
- flutter pub get
- flutter analyze
- flutter test
- flutter build apk

Alternatively, from the repo root you can use the helper script:
- ./booknest-mobile-app-40323-40332/run_flutter.sh pub get
- ./booknest-mobile-app-40323-40332/run_flutter.sh analyze
- ./booknest-mobile-app-40323-40332/run_flutter.sh test
- ./booknest-mobile-app-40323-40332/run_flutter.sh build apk

If you encounter:
"Could not determine project root directory for Flutter project"
— ensure the working directory is set to the Flutter project root above.
