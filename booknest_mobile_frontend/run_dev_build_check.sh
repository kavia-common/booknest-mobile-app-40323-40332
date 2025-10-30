#!/usr/bin/env bash
set -euo pipefail

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
APP_SCRIPT="$REPO_ROOT/booknest-mobile-app-40323-40332/booknest_mobile_frontend/dev_build_check.sh"

if [[ ! -f "$APP_SCRIPT" ]]; then
  echo "Error: Script not found: $APP_SCRIPT"
  exit 1
fi

chmod +x "$APP_SCRIPT" || true
bash "$APP_SCRIPT"
