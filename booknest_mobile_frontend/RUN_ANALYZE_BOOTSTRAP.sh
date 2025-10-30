#!/usr/bin/env bash
# Run the app-local bootstrap_and_analyze from repository root.
set -euo pipefail
APP_DIR="booknest-mobile-app-40323-40332/booknest_mobile_frontend"
cd "$APP_DIR"
bash bootstrap_and_analyze.sh
