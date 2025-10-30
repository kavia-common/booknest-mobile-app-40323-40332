#!/usr/bin/env bash
# Final explicit CI entrypoint. Execute from repository root.
# 1) Ensure flutter is on PATH
# 2) Change dir into the nested Flutter app
# 3) Run pub get and analyze
set -euo pipefail

APP_DIR="booknest-mobile-app-40323-40332/booknest_mobile_frontend"

if ! command -v flutter >/dev/null 2>&1; then
  echo "[CI_RUN_THIS] ERROR: Flutter SDK not found on PATH." >&2
  exit 127
fi

if [ ! -f "$APP_DIR/pubspec.yaml" ]; then
  echo "[CI_RUN_THIS] ERROR: pubspec.yaml not found at $APP_DIR" >&2
  exit 2
fi

echo "[CI_RUN_THIS] cd $APP_DIR"
cd "$APP_DIR"

echo "[CI_RUN_THIS] flutter pub get"
flutter pub get

echo "[CI_RUN_THIS] flutter analyze"
flutter analyze
