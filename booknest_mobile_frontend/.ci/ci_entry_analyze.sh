#!/usr/bin/env bash
set -euo pipefail

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
APP_PATH="$REPO_ROOT/booknest-mobile-app-40323-40332/booknest_mobile_frontend"

echo "[CI] Flutter app root: $APP_PATH"
if [[ ! -f "$APP_PATH/pubspec.yaml" ]]; then
  echo "[CI][ERROR] pubspec.yaml not found at $APP_PATH"
  exit 1
fi

cd "$APP_PATH"
echo "[CI] Running flutter pub get..."
flutter pub get
echo "[CI] Running flutter analyze..."
flutter analyze
