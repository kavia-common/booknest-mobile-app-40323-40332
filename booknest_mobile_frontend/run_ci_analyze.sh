#!/usr/bin/env bash
set -euo pipefail

# Find the Flutter app's pubspec.yaml under known nested path or by search fallback.
REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
DEFAULT_APP_REL="booknest-mobile-app-40323-40332/booknest_mobile_frontend"
DEFAULT_PUBSPEC="$REPO_ROOT/$DEFAULT_APP_REL/pubspec.yaml"

APP_PATH=""
if [[ -f "$DEFAULT_PUBSPEC" ]]; then
  APP_PATH="$REPO_ROOT/$DEFAULT_APP_REL"
else
  # Fallback: search for a pubspec.yaml containing 'flutter:' key
  FOUND="$(grep -Rsl --exclude-dir=".git" --exclude-dir="build" "^name:" "$REPO_ROOT" | grep '/pubspec.yaml' || true)"
  if [[ -n "$FOUND" ]]; then
    # Prefer the nested app path if present
    if echo "$FOUND" | grep -q "$DEFAULT_APP_REL/pubspec.yaml"; then
      APP_PATH="$REPO_ROOT/$DEFAULT_APP_REL"
    else
      # Take first match as a last resort
      APP_PATH="$(dirname "$(echo "$FOUND" | head -n1)")"
    fi
  fi
fi

if [[ -z "$APP_PATH" ]] || [[ ! -f "$APP_PATH/pubspec.yaml" ]]; then
  echo "[ERROR] Could not locate Flutter app pubspec.yaml"
  echo "Searched default: $DEFAULT_PUBSPEC"
  exit 1
fi

echo "[INFO] Flutter app root: $APP_PATH"
cd "$APP_PATH"

export CI=true
flutter pub get
flutter analyze
