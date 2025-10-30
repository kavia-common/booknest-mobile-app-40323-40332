#!/usr/bin/env bash
# Execute from repository root: bash booknest-mobile-app-40323-40332/booknest_mobile_frontend/run_analyzer_here.sh
set -euo pipefail
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$SCRIPT_DIR"
flutter pub get
flutter analyze
