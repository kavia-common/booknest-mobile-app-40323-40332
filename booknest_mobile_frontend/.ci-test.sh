#!/usr/bin/env bash
# Single canonical CI entrypoint for tests; runs inside the nested Flutter app.
set -euo pipefail

APP_DIR="booknest-mobile-app-40323-40332/booknest_mobile_frontend"
if [ ! -d "$APP_DIR" ]; then
  echo "[.ci-test] ERROR: Flutter app directory not found: $APP_DIR" >&2
  exit 1
fi

cd "$APP_DIR"
flutter pub get
CI=true flutter test
