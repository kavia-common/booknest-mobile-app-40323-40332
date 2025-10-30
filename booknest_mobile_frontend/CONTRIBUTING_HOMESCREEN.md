# Contributing — BookNest Mobile (HomeScreen)

Project root (Flutter):
booknest-mobile-app-40323-40332/booknest_mobile_frontend

Run from the path above:
- flutter pub get
- flutter analyze
- flutter test
- flutter run

Key files for HomeScreen:
- lib/screens/home_screen.dart
- lib/services/services.dart (barrel)
- lib/widgets/index.dart (barrel)

Common widgets used:
- BookCard, BookGrid, RatingStars, PriceTag, OceanButton
- SectionHeader, SectionNote, SectionSpacer, SliverPad, EndOfList

Navigation:
- Tapping a book uses /book/:id via Routes.onGenerateRoute

From repository root, you can also run:
- bash ./ci.sh
- bash ./ci_test.sh
- bash ./ci_entry_analyze.sh
- bash ./ci_entry_test.sh
- bash ./ci_bootstrap.sh flutter analyze
- bash ./tools/analyze_nested.sh
- bash ./analyze_nested_app.sh
- make analyze
- make test

If you see:
"Could not determine project root directory for Flutter project"
your command ran from the wrong directory. Use one of the scripts above or cd into the nested app root.
