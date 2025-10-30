#!/usr/bin/env bash
set -euo pipefail

# Resolve repository root
REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

# Read flutter app root pointer
APP_REL_PATH="$(cat "$REPO_ROOT/.ci/FLUTTER_APP_ROOT")"
APP_PATH="$REPO_ROOT/$APP_REL_PATH"

if [[ ! -d "$APP_PATH" ]]; then
  echo "Error: Flutter app root not found at $APP_PATH"
  exit 1
fi

echo "Switching to Flutter app root: $APP_PATH"
cd "$APP_PATH"

# Fetch deps and analyze
flutter pub get
flutter analyze
