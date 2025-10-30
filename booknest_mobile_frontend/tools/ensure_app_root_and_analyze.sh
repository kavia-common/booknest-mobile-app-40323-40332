#!/usr/bin/env bash
# Ensures we're running from the Flutter app root, then runs analyzer.
set -euo pipefail

if [ ! -f "pubspec.yaml" ] || [ ! -d "lib" ]; then
  echo "[ensure_app_root_and_analyze] FATAL: Not in Flutter app root."
  echo "Expected to find pubspec.yaml and lib/ in current directory."
  echo "Fix by running:"
  echo "  cd booknest-mobile-app-40323-40332/booknest_mobile_frontend"
  echo "Then execute:"
  echo "  flutter pub get && flutter analyze"
  exit 3
fi

echo "[ensure_app_root_and_analyze] flutter pub get"
flutter pub get

echo "[ensure_app_root_and_analyze] flutter analyze"
flutter analyze
