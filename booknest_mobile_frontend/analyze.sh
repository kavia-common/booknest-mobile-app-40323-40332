#!/usr/bin/env bash
set -euo pipefail

# Determine repository root (this script is at repo root)
REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Nested Flutter app root
APP_REL_PATH="booknest-mobile-app-40323-40332/booknest_mobile_frontend"
APP_PATH="$REPO_ROOT/$APP_REL_PATH"

if [[ ! -d "$APP_PATH" ]]; then
  echo "Error: Flutter app root not found at $APP_PATH"
  exit 1
fi

echo "Changing directory to Flutter app root: $APP_PATH"
cd "$APP_PATH"

# Ensure dependencies and run analyzer non-interactively
flutter pub get
flutter analyze
