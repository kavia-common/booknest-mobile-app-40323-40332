#!/usr/bin/env bash
# CI Build Entrypoint for Flutter project in nested directory.
set -euo pipefail

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
FLUTTER_DIR="$REPO_ROOT/booknest-mobile-app-40323-40332/booknest_mobile_frontend"

echo "[BUILDER] Switching to Flutter project directory:"
echo "          $FLUTTER_DIR"
cd "$FLUTTER_DIR"

echo "[BUILDER] flutter pub get"
flutter pub get

echo "[BUILDER] flutter build apk"
flutter build apk
