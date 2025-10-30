# Flutter Workspace Entry

This repository contains a nested Flutter app.

- App root:
  booknest-mobile-app-40323-40332/booknest_mobile_frontend

Run from repository root (CI-safe options):
1) bash analyze.sh
2) make analyze
3) bash ci_run_from_env.sh
4) cd booknest-mobile-app-40323-40332/booknest_mobile_frontend && flutter pub get && flutter analyze

If you see:
"Could not determine project root directory for Flutter project"
it means the runner executed flutter analyze from the wrong directory.
