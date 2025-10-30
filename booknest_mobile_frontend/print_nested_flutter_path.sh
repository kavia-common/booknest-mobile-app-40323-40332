#!/usr/bin/env bash
set -euo pipefail

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
APP_REL="booknest-mobile-app-40323-40332/booknest_mobile_frontend"
APP_PATH="$REPO_ROOT/$APP_REL"

echo "Nested Flutter app root:"
echo "  $APP_PATH"
echo
echo "Run analyzer with:"
echo "  cd \"$APP_PATH\" && flutter pub get && flutter analyze"
