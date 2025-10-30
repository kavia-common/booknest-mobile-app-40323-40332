#!/usr/bin/env bash
# Conventional CI script many runners call by default.
# Ensures analysis runs from the nested Flutter app directory.
set -euo pipefail

APP_DIR="booknest-mobile-app-40323-40332/booknest_mobile_frontend"

echo "[test.sh] Repo PWD: $(pwd)"
echo "[test.sh] Checking $APP_DIR"
if [ ! -f "$APP_DIR/pubspec.yaml" ]; then
  echo "[test.sh] FATAL: pubspec.yaml not found at $APP_DIR" >&2
  exit 2
fi

echo "[test.sh] Flutter on PATH: $(command -v flutter || echo 'not found')"
command -v flutter >/dev/null 2>&1 && flutter --version || {
  echo "[test.sh] ERROR: Flutter not on PATH. Install SDK or use run_ci.sh to bootstrap." >&2
  exit 127
}

echo "[test.sh] cd $APP_DIR"
cd "$APP_DIR"

echo "[test.sh] flutter pub get"
flutter pub get

echo "[test.sh] flutter analyze"
flutter analyze
