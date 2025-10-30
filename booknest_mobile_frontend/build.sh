#!/usr/bin/env bash
# Conventional CI entrypoint. Runs from repository root in many runners.
# Forces the working directory into the nested Flutter app before analysis.
set -euo pipefail

APP_DIR="booknest-mobile-app-40323-40332/booknest_mobile_frontend"

if [ ! -f "$APP_DIR/pubspec.yaml" ]; then
  echo "[build.sh] ERROR: $APP_DIR/pubspec.yaml not found" >&2
  exit 2
fi

echo "[build.sh] cd $APP_DIR"
cd "$APP_DIR"

echo "[build.sh] flutter pub get"
flutter pub get

echo "[build.sh] flutter analyze"
flutter analyze
