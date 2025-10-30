# Analyzer Entry — Repository Root

To analyze the nested Flutter app from repository root, run:
- make -f Makefile.ci analyze

This will:
- cd into booknest-mobile-app-40323-40332/booknest_mobile_frontend
- run flutter pub get
- run flutter analyze

If Flutter SDK is not on PATH, ensure your CI installs Flutter before invoking the target above.
