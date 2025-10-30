#!/usr/bin/env bash
# Verbose CI analyzer with diagnostics to confirm correct working directory resolution.
set -euo pipefail

APP_DIR="booknest-mobile-app-40323-40332/booknest_mobile_frontend"

echo "[diagnose] Repository root: $(pwd)"
echo "[diagnose] Listing app dir: $APP_DIR"
ls -la "$APP_DIR" || { echo "[diagnose] ERROR: App dir missing"; exit 2; }

echo "[diagnose] Check pubspec: "
test -f "$APP_DIR/pubspec.yaml" && head -n 20 "$APP_DIR/pubspec.yaml" || { echo "[diagnose] ERROR: pubspec missing"; exit 2; }

echo "[diagnose] Flutter version (if on PATH):"
command -v flutter >/dev/null 2>&1 && flutter --version || echo "flutter not found on PATH (OK for now)"

echo "[diagnose] cd $APP_DIR"
cd "$APP_DIR"

echo "[diagnose] Running flutter pub get"
flutter pub get

echo "[diagnose] Running flutter analyze"
flutter analyze
