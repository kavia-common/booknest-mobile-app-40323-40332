# CI Root Notes

Flutter app path:
- booknest-mobile-app-40323-40332/booknest_mobile_frontend

Run analyzer from the Flutter app root:
- cd booknest-mobile-app-40323-40332/booknest_mobile_frontend
- flutter pub get
- flutter analyze

Android module (if CI needs to locate it):
- booknest-mobile-app-40323-40332/booknest_mobile_frontend/android

Avoid invoking Flutter or Gradle commands from repository root; always cd into the Flutter app first.
