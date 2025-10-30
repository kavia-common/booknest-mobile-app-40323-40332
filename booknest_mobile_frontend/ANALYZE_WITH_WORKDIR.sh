#!/usr/bin/env bash
# Deterministic analyzer using Flutter commands with explicit working-directory.
# Run this from the repository root in CI.
set -euo pipefail

APP_DIR="booknest-mobile-app-40323-40332/booknest_mobile_frontend"

if [ ! -f "$APP_DIR/pubspec.yaml" ]; then
  echo "[ANALYZE_WITH_WORKDIR] FATAL: pubspec.yaml not found at $APP_DIR" >&2
  exit 2
fi

echo "[ANALYZE_WITH_WORKDIR] Flutter: $(command -v flutter || echo 'not found')"
command -v flutter >/dev/null 2>&1 && flutter --version || {
  echo "[ANALYZE_WITH_WORKDIR] ERROR: Flutter SDK not on PATH"; exit 127;
}

# Run pub get with explicit working directory (via subshell) to avoid project root ambiguity.
echo "[ANALYZE_WITH_WORKDIR] Running flutter pub get (cwd=$APP_DIR)"
( cd "$APP_DIR" && flutter pub get )

# Run analyze with explicit working directory.
echo "[ANALYZE_WITH_WORKDIR] Running flutter analyze (cwd=$APP_DIR)"
( cd "$APP_DIR" && flutter analyze )
