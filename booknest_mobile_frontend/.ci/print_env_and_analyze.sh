#!/usr/bin/env bash
# Ultra-verbose analyzer for CI debugging and correct project root usage.
set -euo pipefail

echo "=== ENVIRONMENT ==="
env | sort
echo "=== PWD ==="
pwd
echo "=== REPO CONTENTS (top-level) ==="
ls -la

APP_DIR="booknest-mobile-app-40323-40332/booknest_mobile_frontend"
echo "=== CHECK APP DIR: $APP_DIR ==="
if [ ! -d "$APP_DIR" ]; then
  echo "[FATAL] App directory not found: $APP_DIR" >&2
  exit 2
fi
ls -la "$APP_DIR"

echo "=== CHECK pubspec.yaml ==="
if [ ! -f "$APP_DIR/pubspec.yaml" ]; then
  echo "[FATAL] pubspec.yaml missing in $APP_DIR" >&2
  exit 2
fi
head -n 20 "$APP_DIR/pubspec.yaml"

echo "=== FLUTTER VERSION ==="
if command -v flutter >/dev/null 2>&1; then
  flutter --version
else
  echo "[WARN] flutter not on PATH"
fi

echo "=== CD TO APP DIR AND ANALYZE ==="
cd "$APP_DIR"
flutter pub get
flutter analyze
