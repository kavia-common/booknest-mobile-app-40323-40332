#!/usr/bin/env bash
# Wrapper to run Flutter commands from the correct project root.
# Usage examples:
#   ./run_flutter.sh pub get
#   ./run_flutter.sh analyze
#   ./run_flutter.sh test
#   ./run_flutter.sh build apk
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
FLUTTER_ROOT="$SCRIPT_DIR/booknest_mobile_frontend"

if [ ! -d "$FLUTTER_ROOT" ]; then
  echo "Error: Flutter project directory not found at: $FLUTTER_ROOT" >&2
  exit 1
fi

cd "$FLUTTER_ROOT"
flutter "$@"
