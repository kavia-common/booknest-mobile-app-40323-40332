# CI Maintainers — Flutter App Path and Commands

Flutter app root directory:
booknest-mobile-app-40323-40332/booknest_mobile_frontend

Run analyzer from repository root (absolute path example):
bash -lc "cd $PWD/booknest-mobile-app-40323-40332/booknest_mobile_frontend && flutter pub get && flutter analyze"

Alternatively, use the wrapper:
./flutterw analyze

If CI reports:
"Could not determine project root directory for Flutter project"
then the runner executed Flutter commands outside of the Flutter app root. Always cd into the path above before invoking Flutter.
