# CI Bootstrap Scripts

Use these scripts from the repository root to run Flutter tooling from the correct nested project directory:

- ./.init/run_analyze.sh
- ./.init/run_tests.sh

They automatically `cd` into:
booknest-mobile-app-40323-40332/booknest_mobile_frontend
and execute flutter commands to avoid "Could not determine project root directory for Flutter project".
