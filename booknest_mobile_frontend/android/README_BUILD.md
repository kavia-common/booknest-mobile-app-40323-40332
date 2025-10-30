# Android Build Notes (CI/Analyzer)

This Flutter app uses Android Gradle Plugin (AGP) and Gradle wrapper versions pinned by Flutter tooling.

CI guidance:
- Do NOT run Gradle sync from repository root.
- If CI tries to detect the Android project, ensure it does so from:
  booknest-mobile-app-40323-40332/booknest_mobile_frontend/android
- The Gradle wrapper is already provided at:
  booknest-mobile-app-40323-40332/booknest_mobile_frontend/android/gradle/wrapper/gradle-wrapper.properties

Manual checks (if needed):
- cd booknest-mobile-app-40323-40332/booknest_mobile_frontend
- flutter doctor
- flutter pub get
- flutter build apk  (optional)

If a CI analyzer reports "Could not determine project root directory for Flutter project", it likely executed Flutter tooling outside the Flutter app root. Ensure CI changes directory to:
booknest-mobile-app-40323-40332/booknest_mobile_frontend
before running any Flutter commands.
