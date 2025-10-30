#!/usr/bin/env bash
# Analyze from the Flutter app root. CI should execute this exact script path.
set -euo pipefail

if ! command -v flutter >/dev/null 2>&1; then
  echo "[run_analyze_here.sh] FATAL: Flutter SDK not on PATH" >&2
  exit 127
fi

if [ ! -f "pubspec.yaml" ]; then
  echo "[run_analyze_here.sh] FATAL: Must run from Flutter app root: $(pwd)" >&2
  exit 2
fi

echo "[run_analyze_here.sh] flutter pub get"
flutter pub get

echo "[run_analyze_here.sh] flutter analyze"
flutter analyze
