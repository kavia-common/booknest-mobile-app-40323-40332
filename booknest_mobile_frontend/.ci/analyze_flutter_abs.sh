#!/usr/bin/env bash
set -euo pipefail

# Resolve absolute repository root
REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

# Resolve absolute Flutter app root
APP_PATH="$REPO_ROOT/booknest-mobile-app-40323-40332/booknest_mobile_frontend"

if [[ ! -f "$APP_PATH/pubspec.yaml" ]]; then
  echo "Error: pubspec.yaml not found at: $APP_PATH"
  echo "Repository root: $REPO_ROOT"
  ls -la "$REPO_ROOT" || true
  exit 1
fi

echo "Using Flutter app root: $APP_PATH"
cd "$APP_PATH"

# Optional: Set CI-friendly env to avoid interactive prompts
export CI=true
# If FLUTTER_ROOT is provided by CI, leave it; otherwise continue
# Run deps and analyzer
flutter pub get
flutter analyze
