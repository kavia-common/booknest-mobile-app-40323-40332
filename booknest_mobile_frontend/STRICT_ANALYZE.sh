#!/usr/bin/env bash
# Strict analyzer wrapper that validates project directory resolution before running Flutter.
set -euo pipefail

APP_DIR="booknest-mobile-app-40323-40332/booknest_mobile_frontend"

if [ ! -d "$APP_DIR" ]; then
  echo "[STRICT_ANALYZE] FATAL: App directory does not exist: $APP_DIR" >&2
  exit 2
fi

if [ ! -f "$APP_DIR/pubspec.yaml" ]; then
  echo "[STRICT_ANALYZE] FATAL: pubspec.yaml not found in $APP_DIR" >&2
  exit 2
fi

if ! command -v flutter >/dev/null 2>&1; then
  echo "[STRICT_ANALYZE] FATAL: Flutter SDK not on PATH" >&2
  exit 127
fi

echo "[STRICT_ANALYZE] Running from: $(pwd)"
echo "[STRICT_ANALYZE] Changing to app dir: $APP_DIR"
cd "$APP_DIR"

echo "[STRICT_ANALYZE] flutter pub get"
flutter pub get

echo "[STRICT_ANALYZE] flutter analyze"
flutter analyze
