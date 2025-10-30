#!/usr/bin/env bash
# Robust analyzer for CI: verifies nested app root and invokes flutter analyze.
set -euo pipefail

APP_DIR="booknest-mobile-app-40323-40332/booknest_mobile_frontend"
PKGCFG_FILE="$APP_DIR/.dart_tool/package_config.json"

if ! command -v flutter >/dev/null 2>&1; then
  echo "[tools/run_flutter_analyze_strict] ERROR: flutter is not on PATH" >&2
  exit 127
fi

if [ ! -d "$APP_DIR" ] || [ ! -f "$APP_DIR/pubspec.yaml" ]; then
  echo "[tools/run_flutter_analyze_strict] ERROR: Could not find Flutter app at: $APP_DIR" >&2
  exit 2
fi

echo "[tools/run_flutter_analyze_strict] cd $APP_DIR"
cd "$APP_DIR"

echo "[tools/run_flutter_analyze_strict] flutter pub get"
flutter pub get

# Some CI runners still fail to identify project root; print tree for debugging
echo "[tools/run_flutter_analyze_strict] Project files present:"
ls -la "$PWD"

# Run analyzer; if a package config exists use it explicitly for robustness.
if [ -f "$PKGCFG_FILE" ]; then
  echo "[tools/run_flutter_analyze_strict] Using package config: $PKGCFG_FILE"
fi

echo "[tools/run_flutter_analyze_strict] flutter analyze"
flutter analyze
