#!/usr/bin/env bash
# Executes analyzer via Dart from repo root; compatible with CI runners invoking `dart run`.
set -euo pipefail

# Ensure root deps are fetched so `dart run` can execute tools.
flutter pub get

# Delegate to the previously added Dart tool that changes into the nested app and runs analyzer.
dart run tool/ci_main.dart analyze
