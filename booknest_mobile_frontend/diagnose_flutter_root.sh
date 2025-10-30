#!/usr/bin/env bash
set -euo pipefail

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
APP_REL="booknest-mobile-app-40323-40332/booknest_mobile_frontend"
APP_PATH="$REPO_ROOT/$APP_REL"

echo "Repository root: $REPO_ROOT"
echo "Expected Flutter app path: $APP_PATH"

if [[ -d "$APP_PATH" ]]; then
  echo "[OK] App directory exists."
else
  echo "[ERROR] App directory not found."
  exit 2
fi

if [[ -f "$APP_PATH/pubspec.yaml" ]]; then
  echo "[OK] pubspec.yaml found at: $APP_PATH/pubspec.yaml"
else
  echo "[ERROR] pubspec.yaml not found in expected app path."
  ls -la "$APP_PATH" || true
  exit 3
fi

echo "Suggested commands:"
echo "  cd \"$APP_PATH\" && flutter pub get && flutter analyze"
echo "Or run:"
echo "  bash \"$APP_PATH/run_analyze.sh\""
