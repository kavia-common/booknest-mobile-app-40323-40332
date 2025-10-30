# CI HOWTO — BookNest Flutter App

Flutter app root:
booknest-mobile-app-40323-40332/booknest_mobile_frontend

Run analyzer from repository root using wrapper:
- ./flutterw pub get
- ./flutterw analyze

Or change directory, then run directly:
- cd booknest-mobile-app-40323-40332/booknest_mobile_frontend
- flutter pub get
- flutter analyze

If you see:
"Could not determine project root directory for Flutter project"
the current working directory is not the Flutter app root. Always cd to the path above before running Flutter commands.
