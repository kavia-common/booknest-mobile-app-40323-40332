#!/usr/bin/env bash
# Analyzer shim to be run from the Flutter project root (this directory).
# Ensures pub get is run, then runs analyzer.
set -euo pipefail

echo "[Project Analyzer] flutter pub get"
flutter pub get

echo "[Project Analyzer] flutter analyze"
flutter analyze
