#!/usr/bin/env bash
# CI analyzer alias that changes into the nested Flutter app and runs analysis.
set -euo pipefail
APP_DIR="booknest-mobile-app-40323-40332/booknest_mobile_frontend"
if ! command -v flutter >/dev/null 2>&1; then
  echo "[ci_analyze.sh] FATAL: Flutter SDK not on PATH" >&2
  exit 127
fi
if [ ! -f "$APP_DIR/pubspec.yaml" ]; then
  echo "[ci_analyze.sh] FATAL: pubspec.yaml not found at $APP_DIR" >&2
  exit 2
fi
cd "$APP_DIR"
flutter pub get
flutter analyze
