#!/usr/bin/env bash
# Run analyzer inside this Flutter project using local analysis options.
set -euo pipefail

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$DIR"

# Ensure deps
flutter pub get

# Prefer the local analysis options if present
if [[ -f "analysis_options.local.yaml" ]]; then
  echo "[local-analyze] Using analysis_options.local.yaml"
fi

flutter analyze
