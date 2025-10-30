#!/usr/bin/env bash
set -euo pipefail

# Must be executed from anywhere; this script cds to the Flutter app root.
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$SCRIPT_DIR"

if [[ ! -f "pubspec.yaml" ]]; then
  echo "Error: pubspec.yaml not found in $SCRIPT_DIR"
  exit 1
fi

export CI=true
echo "[INFO] Running flutter pub get..."
flutter pub get

# Attempt a quick build command to validate the project root in CI environments.
# This can be switched to 'flutter build apk --debug' based on CI capabilities.
echo "[INFO] Running a dry build check..."
flutter build apk --debug || {
  echo "[WARN] Build check failed or unsupported in environment; analyzer should still run."
}

echo "[INFO] Running analyzer..."
flutter analyze

echo "[INFO] Dev build check completed."
