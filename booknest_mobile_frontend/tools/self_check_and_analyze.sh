#!/usr/bin/env bash
# Self-check and analyze: must be invoked exactly with this absolute/relative path from repo root
#   bash booknest-mobile-app-40323-40332/booknest_mobile_frontend/tools/self_check_and_analyze.sh
# It validates the Flutter app root and then runs analyzer. Exit codes:
#  3 = not in app root after cd, 127 = flutter missing, 2 = pubspec missing
set -euo pipefail

APP_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")"/.. && pwd)"
echo "[self_check] Resolved APP_DIR: $APP_DIR"

if [ ! -f "$APP_DIR/pubspec.yaml" ] || [ ! -d "$APP_DIR/lib" ]; then
  echo "[self_check][FATAL] pubspec.yaml or lib/ missing at $APP_DIR" >&2
  exit 2
fi

if ! command -v flutter >/dev/null 2>&1; then
  echo "[self_check][FATAL] Flutter SDK not on PATH. Install Flutter or run repo-root: bash run_ci.sh" >&2
  exit 127
fi

echo "[self_check] cd $APP_DIR"
cd "$APP_DIR"

if [ ! -f "pubspec.yaml" ] || [ ! -d "lib" ]; then
  echo "[self_check][FATAL] Not in Flutter app root. Current PWD: $(pwd)" >&2
  exit 3
fi

echo "[self_check] flutter --version"
flutter --version || true

echo "[self_check] flutter pub get"
flutter pub get

echo "[self_check] flutter analyze"
flutter analyze
