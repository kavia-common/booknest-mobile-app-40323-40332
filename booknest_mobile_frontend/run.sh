#!/usr/bin/env bash
# Default entry many CI runners call.
# Delegates to the absolute-path analyzer to avoid any working-directory ambiguity.
set -euo pipefail
bash RUN_ANALYZE_ABS.sh
