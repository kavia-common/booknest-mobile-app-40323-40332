# Run Analyzer From App Root

This file lives at the Flutter app root:
booknest-mobile-app-40323-40332/booknest_mobile_frontend

Run locally:
- flutter pub get
- flutter analyze

CI-safe (absolute path) example:
- bash -lc "cd $PWD/booknest-mobile-app-40323-40332/booknest_mobile_frontend && flutter pub get && flutter analyze"

Or use the included helpers:
- bash run_analyze_here.sh
- dart run tool/run_analyze_here.dart
