# .init CI Entrypoints

These scripts are designed for CI systems that automatically invoke repository `.init` hooks:

- .init/.linter.sh  -> runs `flutter analyze` from the nested Flutter project
- .init/.builder.sh -> runs `flutter build apk` from the nested Flutter project

Both scripts `cd` into:
booknest-mobile-app-40323-40332/booknest_mobile_frontend

If your CI reported:
"Could not determine project root directory for Flutter project"
ensure it invokes `.init/.linter.sh` or `.init/run_analyze.sh` instead of calling `flutter` directly from the repository root.
