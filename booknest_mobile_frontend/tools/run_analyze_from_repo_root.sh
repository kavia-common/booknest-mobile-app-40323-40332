#!/usr/bin/env bash
# This script lives INSIDE the Flutter app and can be invoked from the repo root:
#   bash booknest-mobile-app-40323-40332/booknest_mobile_frontend/tools/run_analyze_from_repo_root.sh
# It ensures the working directory is switched into the app before analyzing.
set -euo pipefail

APP_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")"/.. && pwd)"

echo "[tools/run_analyze_from_repo_root] cd $APP_DIR"
cd "$APP_DIR"

echo "[tools/run_analyze_from_repo_root] flutter pub get"
flutter pub get

echo "[tools/run_analyze_from_repo_root] flutter analyze"
flutter analyze
