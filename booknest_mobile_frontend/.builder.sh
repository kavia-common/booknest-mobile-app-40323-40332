#!/usr/bin/env bash
# Root-level CI builder entrypoint.
# Ensures flutter build runs from the nested Flutter project directory.
set -euo pipefail

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
FLUTTER_DIR="$REPO_ROOT/booknest-mobile-app-40323-40332/booknest_mobile_frontend"

echo "[ROOT BUILDER] cd $FLUTTER_DIR"
cd "$FLUTTER_DIR"

echo "[ROOT BUILDER] flutter pub get"
flutter pub get

echo "[ROOT BUILDER] flutter build apk"
flutter build apk
