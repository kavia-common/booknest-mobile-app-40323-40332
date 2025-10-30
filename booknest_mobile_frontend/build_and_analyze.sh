#!/usr/bin/env bash
# Deterministic CI entrypoint to analyze the nested Flutter app.
# Execute from repository root.
set -euo pipefail

APP_DIR="booknest-mobile-app-40323-40332/booknest_mobile_frontend"

echo "[build_and_analyze] Repo PWD: $(pwd)"
echo "[build_and_analyze] Checking app dir: $APP_DIR"
if [ ! -d "$APP_DIR" ] || [ ! -f "$APP_DIR/pubspec.yaml" ]; then
  echo "[build_and_analyze] FATAL: Could not find Flutter app at $APP_DIR (missing pubspec.yaml)" >&2
  exit 2
fi

echo "[build_and_analyze] Flutter on PATH: $(command -v flutter || echo 'not found')"
if ! command -v flutter >/dev/null 2>&1; then
  echo "[build_and_analyze] ERROR: Flutter SDK not found on PATH. Install Flutter or run: bash run_ci.sh" >&2
  exit 127
fi
flutter --version || true

echo "[build_and_analyze] cd $APP_DIR"
cd "$APP_DIR"

echo "[build_and_analyze] flutter pub get"
flutter pub get

echo "[build_and_analyze] flutter analyze"
flutter analyze
