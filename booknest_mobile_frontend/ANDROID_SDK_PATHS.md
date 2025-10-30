Do not hardcode absolute paths in android/local.properties.
CI should provide:
- ANDROID_HOME or ANDROID_SDK_ROOT (for Android)
- flutter on PATH (for Flutter)

The nested Flutter app already contains a minimal android/local.properties suitable for analysis.
