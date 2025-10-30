#!/usr/bin/env bash
# Canonical analyzer entrypoint for CI: always analyzes the nested Flutter project.
# Usage in CI from repo root:
#   bash ./run_analyzer.sh
set -euo pipefail

# Resolve repository root and app dir absolutely to avoid any relative path issues.
REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
APP_DIR="$REPO_ROOT/booknest-mobile-app-40323-40332/booknest_mobile_frontend"

if [[ ! -d "$APP_DIR" ]]; then
  echo "[run_analyzer] ERROR: Flutter app directory not found: $APP_DIR" >&2
  exit 1
fi

echo "[run_analyzer] cd $APP_DIR"
cd "$APP_DIR"

echo "[run_analyzer] flutter pub get"
flutter pub get

echo "[run_analyzer] flutter analyze"
flutter analyze
