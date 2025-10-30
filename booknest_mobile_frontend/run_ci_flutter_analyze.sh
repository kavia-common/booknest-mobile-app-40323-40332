#!/usr/bin/env bash
# Deterministic analyzer runner for CI, using absolute path to the nested Flutter app.
set -euo pipefail

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
APP_DIR="$REPO_ROOT/booknest-mobile-app-40323-40332/booknest_mobile_frontend"

if ! command -v flutter >/dev/null 2>&1; then
  echo "[run_ci_flutter_analyze] FATAL: Flutter SDK not on PATH" >&2
  exit 127
fi

if [ ! -f "$APP_DIR/pubspec.yaml" ]; then
  echo "[run_ci_flutter_analyze] FATAL: pubspec.yaml not found at: $APP_DIR" >&2
  exit 2
fi

echo "[run_ci_flutter_analyze] Using app: $APP_DIR"
(cd "$APP_DIR" && flutter pub get && flutter analyze)
