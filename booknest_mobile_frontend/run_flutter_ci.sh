#!/usr/bin/env bash
set -euo pipefail

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
APP_PATH="$REPO_ROOT/booknest-mobile-app-40323-40332/booknest_mobile_frontend"

if [[ ! -f "$APP_PATH/pubspec.yaml" ]]; then
  echo "[ERROR] pubspec.yaml not found at: $APP_PATH"
  exit 1
fi

cd "$APP_PATH"
echo "[CI] Using Flutter app root: $(pwd)"
echo "[CI] flutter pub get..."
flutter pub get

echo "[CI] flutter analyze..."
flutter analyze

echo "[CI] flutter test..."
CI=true flutter test
