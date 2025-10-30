#!/usr/bin/env bash
# Regenerate tool files and run analyzer from app root.
set -euo pipefail

# Clean possibly stale tool artifacts
rm -rf .dart_tool 2>/dev/null || true
rm -rf build 2>/dev/null || true

echo "[bootstrap_and_analyze] flutter pub get"
flutter pub get

echo "[bootstrap_and_analyze] flutter analyze"
flutter analyze
