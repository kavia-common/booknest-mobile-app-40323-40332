# CI/Analyzer Working Directory Note

Flutter project root for BookNest mobile app is located at:

booknest-mobile-app-40323-40332/booknest_mobile_frontend

When running analyzer, tests, or builds in CI or locally, ensure the working directory is set to the path above before executing commands such as:
- flutter analyze
- flutter test
- flutter build apk

If you see: "Could not determine project root directory for Flutter project", it usually indicates the command ran from the wrong directory.
