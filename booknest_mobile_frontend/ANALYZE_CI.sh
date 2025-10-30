#!/usr/bin/env bash
# Minimal CI analyzer runner with diagnostics. Execute from repository root.
set -euo pipefail

APP_DIR="booknest-mobile-app-40323-40332/booknest_mobile_frontend"

echo "[ANALYZE_CI] PWD: $(pwd)"
echo "[ANALYZE_CI] Listing APP_DIR: $APP_DIR"
ls -la "$APP_DIR" || { echo "[ANALYZE_CI] FATAL: APP_DIR not found"; exit 2; }

if [ ! -f "$APP_DIR/pubspec.yaml" ]; then
  echo "[ANALYZE_CI] FATAL: pubspec.yaml missing at $APP_DIR"
  exit 2
fi

echo "[ANALYZE_CI] Flutter on PATH: $(command -v flutter || echo 'not found')"
command -v flutter >/dev/null 2>&1 && flutter --version || echo "[ANALYZE_CI] WARN: flutter --version failed (ensure Flutter SDK installed)"

echo "[ANALYZE_CI] cd $APP_DIR"
cd "$APP_DIR"

echo "[ANALYZE_CI] flutter pub get"
flutter pub get

echo "[ANALYZE_CI] flutter analyze"
flutter analyze
