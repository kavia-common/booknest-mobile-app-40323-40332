#!/usr/bin/env bash
# Run flutter analyzer from this app root.
set -euo pipefail
command -v flutter >/dev/null 2>&1 || { echo "[ANALYZE_HERE] Flutter not on PATH"; exit 127; }
echo "[ANALYZE_HERE] flutter pub get"
flutter pub get
echo "[ANALYZE_HERE] flutter analyze"
flutter analyze
