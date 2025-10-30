Execute this exact command from repository root:

bash RUN_ANALYZE_ABS.sh

This script:
- Resolves the nested Flutter app absolute path
- Validates pubspec.yaml is present at:
  booknest-mobile-app-40323-40332/booknest_mobile_frontend
- Runs:
  flutter pub get
  flutter analyze

Notes:
- Ensure Flutter SDK is installed on the runner and 'flutter' is on PATH.
- If SDK is missing, run: bash run_ci.sh (bootstraps stable Flutter locally) then run the command above.
