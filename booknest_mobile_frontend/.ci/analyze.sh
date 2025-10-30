#!/usr/bin/env bash
# CI analyzer entrypoint for BookNest Flutter app.
# This script cd's into the nested Flutter app and runs analyzer deterministically.
set -euo pipefail

APP_DIR="$(dirname "${BASH_SOURCE[0]}")/../booknest-mobile-app-40323-40332/booknest_mobile_frontend"
APP_DIR="$(cd "$(dirname "$APP_DIR")" && cd "$(basename "$APP_DIR")" && pwd)"

if ! command -v flutter >/dev/null 2>&1; then
  echo "[.ci/analyze.sh] FATAL: Flutter SDK not on PATH" >&2
  exit 127
fi

if [ ! -f "$APP_DIR/pubspec.yaml" ]; then
  echo "[.ci/analyze.sh] FATAL: pubspec.yaml not found at: $APP_DIR" >&2
  exit 2
fi

echo "[.ci/analyze.sh] Using app: $APP_DIR"
cd "$APP_DIR"
flutter pub get
flutter analyze
