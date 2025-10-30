#!/usr/bin/env bash
# Root-level linter delegator many CI systems call by default.
set -euo pipefail
cd booknest-mobile-app-40323-40332/booknest_mobile_frontend
flutter pub get
flutter analyze
