#!/usr/bin/env bash
# Runs Flutter analyze using an absolute path to the nested app to avoid any CI cwd issues.
set -euo pipefail

# Resolve repository root absolute path
REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
APP_DIR="$REPO_ROOT/booknest-mobile-app-40323-40332/booknest_mobile_frontend"

if ! command -v flutter >/dev/null 2>&1; then
  echo "[run_analyzer_absolute] FATAL: Flutter SDK not on PATH" >&2
  exit 127
fi

if [ ! -d "$APP_DIR" ] || [ ! -f "$APP_DIR/pubspec.yaml" ]; then
  echo "[run_analyzer_absolute] FATAL: App dir not found or pubspec.yaml missing at: $APP_DIR" >&2
  exit 2
fi

echo "[run_analyzer_absolute] Using app at: $APP_DIR"
echo "[run_analyzer_absolute] flutter pub get"
flutter pub get --project="$APP_DIR" || (cd "$APP_DIR" && flutter pub get)

echo "[run_analyzer_absolute] flutter analyze"
# Some Flutter versions accept --project, others require cwd; try both.
if flutter analyze --project="$APP_DIR"; then
  exit 0
else
  echo "[run_analyzer_absolute] Falling back to analyzing from app cwd"
  (cd "$APP_DIR" && flutter analyze)
fi
