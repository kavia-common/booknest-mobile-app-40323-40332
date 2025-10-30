# CI Guidance: Flutter Analyzer/Test Working Directory

The Flutter project root is:
booknest-mobile-app-40323-40332/booknest_mobile_frontend

In CI, run analyzer and tests from this directory. Example steps:

- bash booknest-mobile-app-40323-40332/booknest_mobile_frontend/ci_analyze_here.sh
- bash booknest-mobile-app-40323-40332/booknest_mobile_frontend/run_flutter_tests.sh

If you see:
"Could not determine project root directory for Flutter project"

It means the CI ran from the wrong directory. Switch working dir to the nested root above or use the scripts provided here.

Quick path check:
- bash booknest-mobile-app-40323-40332/booknest_mobile_frontend/print_pubspec_path.sh
