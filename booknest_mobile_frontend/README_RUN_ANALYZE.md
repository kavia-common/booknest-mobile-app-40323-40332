# CI Analyzer Runner

Use the canonical script from repository root:

bash run_ci_flutter_analyze.sh

This script:
- Resolves the nested Flutter app absolute path
- Runs `flutter pub get` and `flutter analyze` within the app directory

If you see "Could not determine project root directory for Flutter project", ensure the runner executes the script above from the repository root and that the Flutter SDK is on PATH.
