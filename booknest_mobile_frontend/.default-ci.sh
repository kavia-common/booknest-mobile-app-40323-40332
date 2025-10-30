#!/usr/bin/env bash
# Default CI entrypoint: always analyze the nested Flutter project.
set -euo pipefail

APP_DIR="booknest-mobile-app-40323-40332/booknest_mobile_frontend"

if [ ! -d "$APP_DIR" ]; then
  echo "[default-ci] ERROR: Flutter app directory not found: $APP_DIR" >&2
  exit 1
fi

echo "[default-ci] cd $APP_DIR"
cd "$APP_DIR"

echo "[default-ci] flutter pub get"
flutter pub get

echo "[default-ci] flutter analyze"
flutter analyze
