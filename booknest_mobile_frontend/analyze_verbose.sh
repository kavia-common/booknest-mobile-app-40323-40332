#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
echo "[INFO] Flutter app root (this script directory): $SCRIPT_DIR"

if [[ ! -f "$SCRIPT_DIR/pubspec.yaml" ]]; then
  echo "[ERROR] pubspec.yaml not found in $SCRIPT_DIR"
  exit 2
fi

echo "[INFO] Flutter SDK version:"
flutter --version || {
  echo "[ERROR] Flutter not available in PATH"
  exit 3
}

echo "[INFO] Fetching dependencies..."
cd "$SCRIPT_DIR"
flutter pub get

echo "[INFO] Running analyzer from: $(pwd)"
flutter analyze
echo "[INFO] Analyzer completed."
