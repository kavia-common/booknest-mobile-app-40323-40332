# Flutter CI Quick Start (Nested App)

Flutter app root:
booknest-mobile-app-40323-40332/booknest_mobile_frontend

From repository root, use ONE of these:

Analyze only:
- bash .ci/ci_entry_analyze.sh
- make -f Makefile.ci analyze

Analyze + Tests:
- bash run_flutter_ci.sh

Analyze from inside the app:
- cd booknest-mobile-app-40323-40332/booknest_mobile_frontend
- flutter pub get && flutter analyze

Run tests from inside the app:
- cd booknest-mobile-app-40323-40332/booknest_mobile_frontend
- flutter test

Run the app (requires connected device/emulator):
- cd booknest-mobile-app-40323-40332/booknest_mobile_frontend
- flutter run

If you see:
"Could not determine project root directory for Flutter project"
ensure the working directory is the Flutter app root shown above before invoking flutter commands.
