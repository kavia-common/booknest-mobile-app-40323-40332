# CI Path Hints

To avoid "Could not determine project root directory for Flutter project":

- Read the relative Flutter project path from:
  ./.flutter-project-path

- Then cd into that directory before running any Flutter commands:
  cd "$(cat .flutter-project-path)"
  flutter pub get
  flutter analyze
