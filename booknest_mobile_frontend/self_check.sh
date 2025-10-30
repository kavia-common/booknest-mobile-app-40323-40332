#!/usr/bin/env bash
# Run a basic self-check from inside the Flutter app directory.
set -euo pipefail
echo "[self_check] PWD: $(pwd)"
echo "[self_check] Ensuring Flutter project structure..."
test -f "pubspec.yaml"
test -d "lib"
echo "[self_check] Running flutter pub get..."
flutter pub get
echo "[self_check] Running flutter analyze..."
flutter analyze
echo "[self_check] OK"
