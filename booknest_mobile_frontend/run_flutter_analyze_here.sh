#!/usr/bin/env bash
# Run flutter analyze by explicitly setting the project root path.
set -euo pipefail

APP_DIR="booknest-mobile-app-40323-40332/booknest_mobile_frontend"

if ! command -v flutter >/dev/null 2>&1; then
  echo "[run_flutter_analyze_here] FATAL: Flutter SDK not on PATH" >&2
  exit 127
fi

if [ ! -d "$APP_DIR" ] || [ ! -f "$APP_DIR/pubspec.yaml" ]; then
  echo "[run_flutter_analyze_here] FATAL: App dir not found or pubspec missing at: $APP_DIR" >&2
  exit 2
fi

# Some CI runners ignore cd. Use -C to force project directory for flutter analyze.
# flutter analyze does not officially document -C, so we fall back to running from app dir if -C unsupported.
set +e
flutter -C "$APP_DIR" analyze 2>/dev/null
CODE=$?
set -e

if [ $CODE -ne 0 ]; then
  echo "[run_flutter_analyze_here] Falling back to cd into app dir"
  (cd "$APP_DIR" && flutter pub get && flutter analyze)
fi
