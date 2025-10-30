#!/usr/bin/env bash
# Delegates to the app-local guard script with explicit cwd.
set -euo pipefail
APP_DIR="booknest-mobile-app-40323-40332/booknest_mobile_frontend"
cd "$APP_DIR"
bash tools/ensure_app_root_and_analyze.sh
