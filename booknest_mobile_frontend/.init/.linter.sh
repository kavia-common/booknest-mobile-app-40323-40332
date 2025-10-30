#!/usr/bin/env bash
# CI linter entrypoint used by the pipeline (exact path/name from logs).
# Runs analyzer from the nested Flutter app directory.
set -euo pipefail

APP_DIR="booknest-mobile-app-40323-40332/booknest_mobile_frontend"

echo "[CI LINTER] Switching to Flutter app: $APP_DIR"
cd "$APP_DIR"

echo "[CI LINTER] flutter pub get"
flutter pub get

echo "[CI LINTER] flutter analyze"
flutter analyze
