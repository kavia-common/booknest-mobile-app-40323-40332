To run static analysis for the nested Flutter app:

Option A (recommended in CI):
- Use a Flutter image and set working dir to: booknest-mobile-app-40323-40332/booknest_mobile_frontend
- Run:
  flutter pub get
  flutter analyze

Option B (from repo root):
- bash RUN_FLUTTER_ANALYZE.sh
- or:
  bash .ci/bootstrap_and_analyze.sh
