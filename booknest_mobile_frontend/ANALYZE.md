# Analyze the BookNest Flutter App

This directory is the Flutter project root.

Run analyzer locally:
1) flutter pub get
2) flutter analyze

Run tests:
- flutter test

Run the app:
- flutter run

From repository root, you can also run:
- bash .ci/run.sh
- bash run_ci_analyze.sh
- make -f Makefile.ci analyze

If you see:
"Could not determine project root directory for Flutter project"
you are not in the Flutter app root. cd to:
booknest-mobile-app-40323-40332/booknest_mobile_frontend
and retry the commands above.
