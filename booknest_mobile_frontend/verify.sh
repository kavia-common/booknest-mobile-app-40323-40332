#!/usr/bin/env bash
# Deterministic verification script for CI. Run from repository root.
set -euo pipefail

APP_DIR="booknest-mobile-app-40323-40332/booknest_mobile_frontend"

echo "[verify] Repo PWD: $(pwd)"
echo "[verify] Checking app dir: $APP_DIR"
if [ ! -d "$APP_DIR" ] || [ ! -f "$APP_DIR/pubspec.yaml" ]; then
  echo "[verify][FATAL] Flutter app not found at $APP_DIR (missing pubspec.yaml)" >&2
  exit 2
fi

if ! command -v flutter >/dev/null 2>&1; then
  echo "[verify][FATAL] Flutter SDK not on PATH. Install Flutter or run: bash run_ci.sh" >&2
  exit 127
fi

echo "[verify] Flutter version:"
flutter --version || true

echo "[verify] cd $APP_DIR"
cd "$APP_DIR"

echo "[verify] flutter pub get"
flutter pub get

echo "[verify] flutter analyze"
flutter analyze
