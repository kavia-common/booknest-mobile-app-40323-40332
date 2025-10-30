#!/usr/bin/env bash
set -euo pipefail

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
APP_REL="booknest-mobile-app-40323-40332/booknest_mobile_frontend"
APP_PATH="$REPO_ROOT/$APP_REL"

if [[ ! -d "$APP_PATH" || ! -f "$APP_PATH/pubspec.yaml" ]]; then
  echo "[ERROR] Flutter app root not found at: $APP_PATH"
  exit 1
fi

cd "$APP_PATH"
echo "[INFO] Running flutter pub get..."
flutter pub get
echo "[INFO] Launching BookNest app..."
flutter run
