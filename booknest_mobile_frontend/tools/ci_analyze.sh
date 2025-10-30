#!/usr/bin/env bash
# CI entrypoint to run analyze from this Flutter project directory.
set -euo pipefail
DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$DIR"
flutter pub get
flutter analyze
