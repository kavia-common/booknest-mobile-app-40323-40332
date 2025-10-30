#!/usr/bin/env bash
# Canonical analyzer entrypoint. Execute from repository root.
set -euo pipefail

APP_DIR="booknest-mobile-app-40323-40332/booknest_mobile_frontend"

if [ ! -f "$APP_DIR/pubspec.yaml" ]; then
  echo "[RUN_ANALYZE] ERROR: pubspec.yaml not found at $APP_DIR" >&2
  exit 2
fi

echo "[RUN_ANALYZE] cd $APP_DIR"
cd "$APP_DIR"

echo "[RUN_ANALYZE] flutter pub get"
flutter pub get

echo "[RUN_ANALYZE] flutter analyze"
flutter analyze
