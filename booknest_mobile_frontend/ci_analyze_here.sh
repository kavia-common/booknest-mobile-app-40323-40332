#!/usr/bin/env bash
# Runs flutter analyze from the correct nested Flutter project root.
# Usage in CI:
#   bash booknest-mobile-app-40323-40332/booknest_mobile_frontend/ci_analyze_here.sh

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
APP_ROOT="$SCRIPT_DIR"

echo "[CI] Switching to Flutter project root: $APP_ROOT"
cd "$APP_ROOT"

echo "[CI] Flutter SDK version:"
flutter --version || true

echo "[CI] Running flutter pub get..."
flutter pub get

echo "[CI] Running flutter analyze..."
flutter analyze
