#!/usr/bin/env bash
# Verifies nested Flutter project path and runs analyzer from there.
set -euo pipefail

APP_DIR="booknest-mobile-app-40323-40332/booknest_mobile_frontend"

if [ ! -d "$APP_DIR" ]; then
  echo "[verify_and_analyze] ERROR: Flutter app directory not found at $APP_DIR" >&2
  exit 1
fi

echo "[verify_and_analyze] cd $APP_DIR"
cd "$APP_DIR"

echo "[verify_and_analyze] flutter pub get"
flutter pub get

echo "[verify_and_analyze] flutter analyze"
flutter analyze
