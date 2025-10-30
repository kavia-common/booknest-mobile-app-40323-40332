#!/usr/bin/env bash
set -euo pipefail

APP_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
echo "Flutter project root:"
echo "  $APP_ROOT"
echo
echo "Run analyzer from here with:"
echo "  cd \"$APP_ROOT\" && flutter pub get && flutter analyze"
