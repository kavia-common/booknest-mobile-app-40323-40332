#!/usr/bin/env bash
set -euo pipefail

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
APP_REL="booknest-mobile-app-40323-40332/booknest_mobile_frontend"
APP_PATH="$REPO_ROOT/$APP_REL"

echo "[INFO] Repository root: $REPO_ROOT"
echo "[INFO] Flutter app path: $APP_PATH"

if [[ ! -d "$APP_PATH" ]]; then
  echo "[ERROR] App directory not found at $APP_PATH"
  exit 2
fi

if [[ ! -f "$APP_PATH/pubspec.yaml" ]]; then
  echo "[ERROR] pubspec.yaml not found at $APP_PATH"
  ls -la "$APP_PATH" || true
  exit 3
fi

echo "[INFO] Changing directory to Flutter app root..."
cd "$APP_PATH"

export CI=true
echo "[INFO] Running flutter pub get..."
flutter pub get

echo "[INFO] Running flutter analyze..."
flutter analyze
