#!/usr/bin/env bash
set -euo pipefail

# This script must live in the Flutter app root and be run from any directory.
# It will cd into its own directory and run analyze to avoid path issues.

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$SCRIPT_DIR"

# Quick sanity check
if [[ ! -f "pubspec.yaml" ]]; then
  echo "Error: pubspec.yaml not found in $SCRIPT_DIR"
  exit 1
fi

export CI=true
flutter pub get
flutter analyze
