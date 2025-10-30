# Flutter Project Root Pointer

CI systems: the Flutter app root is nested at:
booknest-mobile-app-40323-40332/booknest_mobile_frontend

Invoke analyzer from repository root via one of:
- make analyze
- bash .ci/run_flutter_analyze.sh
- bash .ci/analyze_flutter_abs.sh
- bash booknest-mobile-app-40323-40332/booknest_mobile_frontend/run_analyze.sh

If an error occurs:
"Could not determine project root directory for Flutter project"
ensure the working directory is the nested Flutter app root path above before executing flutter commands.
