# CI Helper Scripts

Flutter app is nested at:
booknest-mobile-app-40323-40332/booknest_mobile_frontend

To analyze from repository root (absolute path):
- bash .ci/analyze_flutter_abs.sh

If CI reports:
"Could not determine project root directory for Flutter project"
ensure CI runs one of the provided scripts from the repository root so it cds into the nested Flutter app before invoking flutter.
