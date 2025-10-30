CI must set working directory to:
booknest-mobile-app-40323-40332/booknest_mobile_frontend

Then run:
flutter pub get
flutter analyze

If your CI cannot change workdir, execute one of these from repo root:
- bash RUN_ANALYZE.sh
- bash run_ci.sh
- bash .ci/diagnose_and_analyze.sh

Note: The “Could not determine project root directory for Flutter project” error indicates the analyzer is not running inside the Flutter app directory. No additional code changes are required for HomeScreen or navigation; the app builds when analyzed from the nested app root.
