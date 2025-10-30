#!/usr/bin/env bash
# Conventional CI entry: run tests or analysis.
# Here we run analyzer for the nested Flutter app deterministically.
set -euo pipefail

APP_DIR="booknest-mobile-app-40323-40332/booknest_mobile_frontend"

echo "[run_tests] Repo PWD: $(pwd)"
if [ ! -d "$APP_DIR" ] || [ ! -f "$APP_DIR/pubspec.yaml" ]; then
  echo "[run_tests][FATAL] Flutter app not found at: $APP_DIR" >&2
  exit 2
fi

if ! command -v flutter >/dev/null 2>&1; then
  echo "[run_tests][FATAL] Flutter not on PATH. Install Flutter or run: bash run_ci.sh" >&2
  exit 127
fi

echo "[run_tests] Flutter version:"
flutter --version || true

echo "[run_tests] cd $APP_DIR"
cd "$APP_DIR"

echo "[run_tests] flutter pub get"
flutter pub get

echo "[run_tests] flutter analyze"
flutter analyze
