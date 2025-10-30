#!/usr/bin/env bash
# Delegates linting to the nested Flutter project to avoid root-dir detection issues.
set -euo pipefail
REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
FLUTTER_DIR="$REPO_ROOT/booknest-mobile-app-40323-40332/booknest_mobile_frontend"
cd "$FLUTTER_DIR"
flutter pub get
flutter analyze
