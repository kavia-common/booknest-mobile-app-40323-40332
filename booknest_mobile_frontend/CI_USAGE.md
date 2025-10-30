# CI Usage for BookNest Flutter App

The Flutter app is nested at:
booknest-mobile-app-40323-40332/booknest_mobile_frontend

Recommended ways to run analyzer from repository root:
- make -f Makefile.ci analyze
- bash .ci/run.sh
- bash .ci/run_flutter_analyze.sh
- bash .ci/analyze_flutter_abs.sh
- bash run_ci_analyze.sh
- bash booknest-mobile-app-40323-40332/booknest_mobile_frontend/run_analyze.sh

Direct commands from app root:
cd booknest-mobile-app-40323-40332/booknest_mobile_frontend && flutter pub get && flutter analyze

If you see:
"Could not determine project root directory for Flutter project"
it means the current working directory is not the Flutter app root. Change to the path above before running flutter commands.
