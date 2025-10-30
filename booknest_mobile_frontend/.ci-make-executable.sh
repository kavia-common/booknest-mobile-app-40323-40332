#!/usr/bin/env bash
# Ensures CI scripts are executable in environments that strip exec bits.
set -euo pipefail
chmod +x RUN_ANALYZE.sh || true
chmod +x run_ci.sh || true
chmod +x booknest-mobile-app-40323-40332/booknest_mobile_frontend/analyze.sh || true
chmod +x booknest-mobile-app-40323-40332/booknest_mobile_frontend/ci_run.sh || true
chmod +x booknest-mobile-app-40323-40332/booknest_mobile_frontend/run_analyzer_here.sh || true
