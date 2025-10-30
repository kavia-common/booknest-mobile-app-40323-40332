#!/usr/bin/env bash
# Unified CI analyzer entrypoint for BookNest.
# Ensures Flutter runs from the nested Flutter project directory.
set -euo pipefail

APP_DIR="booknest-mobile-app-40323-40332/booknest_mobile_frontend"

if [ ! -d "$APP_DIR" ]; then
  echo "[.ci_build] ERROR: Flutter app directory not found: $APP_DIR" >&2
  exit 1
fi

echo "[.ci_build] cd $APP_DIR"
cd "$APP_DIR"

echo "[.ci_build] flutter pub get"
flutter pub get

echo "[.ci_build] flutter analyze"
flutter analyze
