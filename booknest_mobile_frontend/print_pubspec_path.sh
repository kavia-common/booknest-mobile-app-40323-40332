#!/usr/bin/env bash
# Prints absolute path to pubspec.yaml to verify CI working directory assumptions.

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
echo "[CI] pubspec.yaml expected at:"
echo "$SCRIPT_DIR/pubspec.yaml"
test -f "$SCRIPT_DIR/pubspec.yaml" && echo "[CI] Found pubspec.yaml ✅" || { echo "[CI] pubspec.yaml not found ❌"; exit 1; }
