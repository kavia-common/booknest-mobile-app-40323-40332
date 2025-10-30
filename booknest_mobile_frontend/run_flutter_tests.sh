#!/usr/bin/env bash
# Runs flutter tests from the correct nested Flutter project root.
# Usage in CI:
#   bash booknest-mobile-app-40323-40332/booknest_mobile_frontend/run_flutter_tests.sh

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
APP_ROOT="$SCRIPT_DIR"

echo "[CI] Switching to Flutter project root: $APP_ROOT"
cd "$APP_ROOT"

echo "[CI] Running flutter pub get..."
flutter pub get

echo "[CI] Running flutter test..."
CI=true flutter test
