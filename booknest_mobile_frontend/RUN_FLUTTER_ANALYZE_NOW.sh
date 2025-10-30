#!/usr/bin/env bash
# Final, deterministic analyzer runner for CI. Execute from repository root.
# Fails fast with explicit exit codes/messages and delegates to the app-local script.
set -euo pipefail

APP_CMD="booknest-mobile-app-40323-40332/booknest_mobile_frontend/tools/self_check_and_analyze.sh"

if [ ! -f "$APP_CMD" ]; then
  echo "[RUN_FLUTTER_ANALYZE_NOW] FATAL: App analyzer not found at: $APP_CMD" >&2
  exit 2
fi

bash "$APP_CMD"
