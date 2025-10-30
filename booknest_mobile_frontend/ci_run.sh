#!/usr/bin/env bash
# App-local CI entrypoint. Execute this from any directory:
# bash booknest-mobile-app-40323-40332/booknest_mobile_frontend/ci_run.sh
set -euo pipefail

APP_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "[app/ci_run.sh] Using Flutter at: $(command -v flutter || echo 'flutter not on PATH')"
flutter --version || true

echo "[app/ci_run.sh] cd $APP_DIR"
cd "$APP_DIR"

echo "[app/ci_run.sh] flutter pub get"
flutter pub get

echo "[app/ci_run.sh] flutter analyze"
flutter analyze
