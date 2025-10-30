# BookNest Workspace

This repository hosts:
- A minimal root-level Flutter meta package used to satisfy CI analyzers that run from the repo root.
- The actual BookNest mobile Flutter app here:
  booknest-mobile-app-40323-40332/booknest_mobile_frontend

How to analyze locally:
- cd booknest-mobile-app-40323-40332/booknest_mobile_frontend
- flutter pub get
- flutter analyze

How to run tests locally:
- cd booknest-mobile-app-40323-40332/booknest_mobile_frontend
- flutter pub get
- flutter test

CI options (recommended):
- Use scripts that enforce the correct working directory:
  - bash booknest-mobile-app-40323-40332/booknest_mobile_frontend/ci_analyze_here.sh
  - bash booknest-mobile-app-40323-40332/booknest_mobile_frontend/run_flutter_tests.sh
  - bash booknest-mobile-app-40323-40332/booknest_mobile_frontend/print_pubspec_path.sh

If you encounter:
"Could not determine project root directory for Flutter project"
it means the analyzer/test step ran from the wrong directory. Ensure CI switches into:
booknest-mobile-app-40323-40332/booknest_mobile_frontend
before running flutter commands, or call the scripts above.
