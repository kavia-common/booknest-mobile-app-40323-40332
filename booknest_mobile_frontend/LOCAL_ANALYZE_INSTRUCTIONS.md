To verify analysis locally (outside CI):

1) Ensure Flutter SDK is installed and on PATH
   flutter --version

2) Change directory into the nested Flutter app:
   cd booknest-mobile-app-40323-40332/booknest_mobile_frontend

3) Get packages and analyze:
   flutter pub get
   flutter analyze

If these steps work locally but fail in CI with:
"Could not determine project root directory for Flutter project"
then the CI is not changing its working directory into the nested app.
Use the already added canonical script from repository root:
   bash RUN_ANALYZE.sh
or
   bash run_ci.sh
