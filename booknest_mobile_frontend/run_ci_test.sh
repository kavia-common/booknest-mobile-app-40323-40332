#!/usr/bin/env bash
# Canonical CI test entrypoint for BookNest.
# Always run tests inside the nested Flutter project directory.

set -euo pipefail

APP_DIR="booknest-mobile-app-40323-40332/booknest_mobile_frontend"

if [ ! -d "$APP_DIR" ]; then
  echo "[run_ci_test] ERROR: Flutter app directory not found: $APP_DIR" >&2
  exit 1
fi

echo "[run_ci_test] cd $APP_DIR"
cd "$APP_DIR"

echo "[run_ci_test] flutter pub get"
flutter pub get

echo "[run_ci_test] CI=true flutter test"
CI=true flutter test
