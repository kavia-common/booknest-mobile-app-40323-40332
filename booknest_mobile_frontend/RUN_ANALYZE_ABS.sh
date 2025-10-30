#!/usr/bin/env bash
# Absolute-path analyzer runner. Execute from repository root.
set -euo pipefail

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
APP_REL="booknest-mobile-app-40323-40332/booknest_mobile_frontend"
APP_DIR="$REPO_ROOT/$APP_REL"

echo "[ABS] REPO_ROOT: $REPO_ROOT"
echo "[ABS] APP_DIR:   $APP_DIR"

if [ ! -d "$APP_DIR" ]; then
  echo "[ABS][FATAL] App directory not found: $APP_DIR" >&2
  exit 2
fi
if [ ! -f "$APP_DIR/pubspec.yaml" ]; then
  echo "[ABS][FATAL] pubspec.yaml missing in $APP_DIR" >&2
  exit 2
fi

if ! command -v flutter >/dev/null 2>&1; then
  echo "[ABS][FATAL] Flutter SDK not on PATH. Install Flutter or run: bash run_ci.sh" >&2
  exit 127
fi

echo "[ABS] Flutter version:"
flutter --version || true

echo "[ABS] Running flutter pub get (cwd=$APP_DIR)"
( cd "$APP_DIR" && flutter pub get )

echo "[ABS] Running flutter analyze (cwd=$APP_DIR)"
( cd "$APP_DIR" && flutter analyze )
