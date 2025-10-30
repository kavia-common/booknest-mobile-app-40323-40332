Use this ONE command for analysis from repository root:

bash RUN_ANALYZE.sh

This script:
- cds into booknest-mobile-app-40323-40332/booknest_mobile_frontend
- runs: flutter pub get
- runs: flutter analyze

Ensure the CI image/runner has Flutter SDK installed and flutter is on PATH.
