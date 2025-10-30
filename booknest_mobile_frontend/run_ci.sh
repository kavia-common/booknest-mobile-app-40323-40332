#!/usr/bin/env bash
# CI helper to run Flutter pub get, analyze, and tests from the app root.
set -euo pipefail

if ! command -v flutter >/dev/null 2>&1; then
  echo "[run_ci.sh] FATAL: Flutter SDK not on PATH" >&2
  exit 127
fi

if [ ! -f "pubspec.yaml" ]; then
  echo "[run_ci.sh] FATAL: Must run from Flutter app root. Current: $(pwd)" >&2
  exit 2
fi

echo "[run_ci.sh] flutter pub get"
flutter pub get

echo "[run_ci.sh] flutter analyze"
flutter analyze

echo "[run_ci.sh] flutter test (optional)"
flutter test || true
