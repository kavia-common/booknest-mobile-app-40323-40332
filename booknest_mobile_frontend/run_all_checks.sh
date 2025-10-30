#!/usr/bin/env bash
# Runs flutter pub get, analyze, and tests from the Flutter app root.
set -euo pipefail

if [ ! -f "pubspec.yaml" ]; then
  echo "[run_all_checks.sh] Must be executed from the Flutter app root." >&2
  exit 2
fi

command -v flutter >/dev/null 2>&1 || { echo "[run_all_checks.sh] Flutter SDK not on PATH"; exit 127; }

echo "[run_all_checks.sh] flutter pub get"
flutter pub get

echo "[run_all_checks.sh] flutter analyze"
flutter analyze

echo "[run_all_checks.sh] flutter test"
flutter test
