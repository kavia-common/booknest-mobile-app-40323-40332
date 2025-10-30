#!/usr/bin/env bash
set -euo pipefail

# This script must be executed from any directory; it cd's to the app root (where this script resides)
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$SCRIPT_DIR"

if [[ ! -f "pubspec.yaml" ]]; then
  echo "Error: pubspec.yaml not found in $SCRIPT_DIR"
  exit 1
fi

export CI=true
flutter pub get
flutter analyze
