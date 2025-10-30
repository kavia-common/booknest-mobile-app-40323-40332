#!/usr/bin/env bash
# GitHub-style CI analyzer entrypoint usable by generic runners.
set -euo pipefail

APP_DIR="booknest-mobile-app-40323-40332/booknest_mobile_frontend"

echo "[.github_ci_analyze] cd $APP_DIR"
cd "$APP_DIR"

echo "[.github_ci_analyze] flutter pub get"
flutter pub get

echo "[.github_ci_analyze] flutter analyze"
flutter analyze
