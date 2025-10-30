#!/usr/bin/env bash
set -euo pipefail

echo "PWD: $(pwd)"
echo "Repo root contents:"
ls -la | sed -e 's/^/  /'

APP_DIR="booknest-mobile-app-40323-40332/booknest_mobile_frontend"
echo "App dir ($APP_DIR) contents:"
ls -la "$APP_DIR" | sed -e 's/^/  /'

echo "Flutter on PATH: $(command -v flutter || echo 'not found')"
command -v flutter >/dev/null 2>&1 && flutter --version || true

echo "Running canonical analyzer..."
bash RUN_ANALYZE.sh
