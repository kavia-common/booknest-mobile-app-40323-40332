#!/usr/bin/env bash
# CI runner that sources .env.ci and runs analyzer from the nested Flutter app directory.
set -euo pipefail

if [ ! -f ".env.ci" ]; then
  echo "[ci_run_from_env] FATAL: .env.ci not found at repo root." >&2
  exit 2
fi
# shellcheck disable=SC1091
source ".env.ci"

if [ -z "${CI_APP_DIR:-}" ] || [ ! -d "$CI_APP_DIR" ] || [ ! -f "$CI_APP_DIR/pubspec.yaml" ]; then
  echo "[ci_run_from_env] FATAL: CI_APP_DIR invalid or pubspec missing: '${CI_APP_DIR:-<unset>}'" >&2
  exit 2
fi

echo "[ci_run_from_env] Flutter on PATH: $(command -v flutter || echo 'not found')"
command -v flutter >/dev/null 2>&1 || { echo "[ci_run_from_env] FATAL: Flutter SDK not on PATH"; exit 127; }

echo "[ci_run_from_env] cd $CI_APP_DIR"
cd "$CI_APP_DIR"

echo "[ci_run_from_env] flutter pub get"
flutter pub get

echo "[ci_run_from_env] flutter analyze"
flutter analyze
