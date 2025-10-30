#!/usr/bin/env bash
# Strict analyzer runner. Run from repository root.
set -euo pipefail

APP_DIR="booknest-mobile-app-40323-40332/booknest_mobile_frontend"

echo "[STRICT] Repo PWD: $(pwd)"
echo "[STRICT] Checking app directory: $APP_DIR"
if [ ! -d "$APP_DIR" ]; then
  echo "[STRICT][FATAL] App directory not found: $APP_DIR" >&2
  exit 2
fi
if [ ! -f "$APP_DIR/pubspec.yaml" ]; then
  echo "[STRICT][FATAL] pubspec.yaml missing at $APP_DIR" >&2
  exit 2
fi

echo "[STRICT] Flutter on PATH: $(command -v flutter || echo 'not found')"
command -v flutter >/dev/null 2>&1 && flutter --version || echo "[STRICT] WARN: flutter not on PATH (install SDK)"

echo "[STRICT] cd $APP_DIR"
cd "$APP_DIR"

echo "[STRICT] Running flutter pub get"
flutter pub get

echo "[STRICT] Running flutter analyze"
flutter analyze
