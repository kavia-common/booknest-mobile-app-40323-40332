#!/usr/bin/env bash
# Deterministic CI executor. Reads nested Flutter app path from FLUTTER_APP_PATH.
# Usage (from repo root): bash .ci-exec-runner.sh
set -euo pipefail

APP_PATH_FILE="FLUTTER_APP_PATH"
if [ ! -f "$APP_PATH_FILE" ]; then
  echo "[.ci-exec-runner] ERROR: $APP_PATH_FILE not found at repo root." >&2
  exit 2
fi

APP_DIR="$(cat "$APP_PATH_FILE" | tr -d '\r\n')"

if [ -z "$APP_DIR" ] || [ ! -d "$APP_DIR" ] || [ ! -f "$APP_DIR/pubspec.yaml" ] ; then
  echo "[.ci-exec-runner] ERROR: Invalid Flutter app dir: '$APP_DIR' (missing or no pubspec.yaml)" >&2
  exit 2
fi

echo "[.ci-exec-runner] Using Flutter: $(command -v flutter || echo 'flutter not on PATH')"
command -v flutter >/dev/null 2>&1 && flutter --version || true

echo "[.ci-exec-runner] cd $APP_DIR"
cd "$APP_DIR"

echo "[.ci-exec-runner] flutter pub get"
flutter pub get

echo "[.ci-exec-runner] flutter analyze"
flutter analyze
