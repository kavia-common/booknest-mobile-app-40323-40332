# CI Notes — BookNest Flutter App

Flutter app is nested at:
booknest-mobile-app-40323-40332/booknest_mobile_frontend

Run analyzer via Makefile (from repo root):
- make analyze

Or call the script directly:
- bash .ci/run_flutter_analyze.sh

If CI shows:
"Could not determine project root directory for Flutter project"
ensure the working directory (or script) changes directory into the nested Flutter app root before executing flutter commands.
