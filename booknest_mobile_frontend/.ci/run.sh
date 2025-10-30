#!/usr/bin/env bash
set -euo pipefail

# Resolve repository root (this script is under .ci/)
REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

TARGET_SCRIPT="$REPO_ROOT/booknest-mobile-app-40323-40332/booknest_mobile_frontend/run_analyze.sh"

if [[ ! -x "$TARGET_SCRIPT" ]]; then
  echo "Making nested analyzer script executable: $TARGET_SCRIPT"
  chmod +x "$TARGET_SCRIPT" || true
fi

echo "Executing nested Flutter analyze script: $TARGET_SCRIPT"
bash "$TARGET_SCRIPT"
