#!/usr/bin/env bash
# CI build wrapper: runs flutter build from the nested Flutter project.
set -euo pipefail

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
FLUTTER_DIR="$REPO_ROOT/booknest-mobile-app-40323-40332/booknest_mobile_frontend"

echo "[CI] Changing to Flutter app directory: $FLUTTER_DIR"
cd "$FLUTTER_DIR"

echo "[CI] flutter pub get"
flutter pub get

echo "[CI] flutter build apk"
flutter build apk
