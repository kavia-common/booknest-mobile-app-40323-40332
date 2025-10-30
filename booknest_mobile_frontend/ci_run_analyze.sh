#!/usr/bin/env bash
# CI helper: run Flutter analyze from the correct project root.
# Usage: ./ci_run_analyze.sh
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
FLUTTER_DIR="$ROOT_DIR/booknest-mobile-app-40323-40332/booknest_mobile_frontend"

echo "[CI] Changing directory to Flutter project: $FLUTTER_DIR"
cd "$FLUTTER_DIR"

echo "[CI] Running: flutter pub get"
flutter pub get

echo "[CI] Running: flutter analyze"
flutter analyze
