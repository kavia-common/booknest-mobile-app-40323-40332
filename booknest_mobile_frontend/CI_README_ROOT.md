Run analyzer for the nested Flutter app from repository root:

Preferred:
- bash RUN_ANALYZE_ABS.sh

Alternatives:
- bash RUN_ANALYZE.sh
- bash RUN_ANALYZE_STRICT.sh
- bash build_and_analyze.sh
- bash run_ci.sh        # bootstraps Flutter SDK if missing
- bash verify.sh

All commands execute in:
booknest-mobile-app-40323-40332/booknest_mobile_frontend

Manual steps:
- cd booknest-mobile-app-40323-40332/booknest_mobile_frontend
- flutter pub get
- flutter analyze
