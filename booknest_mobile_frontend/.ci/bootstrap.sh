#!/usr/bin/env bash
# Robust CI bootstrap:
# - Ensures Flutter SDK is available (installs locally if missing)
# - Changes working directory to nested Flutter app
# - Runs flutter pub get + flutter analyze

set -euo pipefail

APP_DIR="booknest-mobile-app-40323-40332/booknest_mobile_frontend"
SDK_DIR=".flutter-sdk"

have_flutter() {
  command -v flutter >/dev/null 2>&1
}

if ! have_flutter; then
  echo "[bootstrap.sh] Flutter not found on PATH. Bootstrapping stable SDK locally..."
  if [ ! -d "$SDK_DIR" ]; then
    git clone --depth 1 https://github.com/flutter/flutter.git -b stable "$SDK_DIR"
  fi
  export PATH="$PWD/$SDK_DIR/bin:$PATH"
  flutter --version
else
  echo "[bootstrap.sh] Using system Flutter: $(command -v flutter)"
  flutter --version || true
fi

if [ ! -f "$APP_DIR/pubspec.yaml" ]; then
  echo "[bootstrap.sh] ERROR: pubspec.yaml not found at $APP_DIR" >&2
  exit 2
fi

echo "[bootstrap.sh] cd $APP_DIR"
cd "$APP_DIR"

echo "[bootstrap.sh] flutter pub get"
flutter pub get

echo "[bootstrap.sh] flutter analyze"
flutter analyze
