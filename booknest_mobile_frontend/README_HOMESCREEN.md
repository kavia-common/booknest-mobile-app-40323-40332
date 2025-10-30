# HomeScreen — Feature Overview

Sections implemented:
- Featured (horizontal list using RecommendationService.topPopular)
- Categories (ChoiceChips to filter recommendations)
- Recommended (BookGrid using filtered SampleData)
- End-of-list indicator (UX polish)

Data and services:
- Uses services/sample_data.dart for demo data
- Uses services/recommendation_service.dart for simple popularity/category logic
- Barrel: services/services.dart aggregates service exports

Widgets used:
- BookCard, BookGrid, RatingStars, PriceTag
- SectionHeader, SectionNote, SectionSpacer, SliverPad
- EndOfList (subtle end marker)

Navigation:
- Tapping a book navigates to /book/:id
- Handled by Routes.onGenerateRoute with BookDetailsScreen

Developer notes:
- To run locally:
  - cd booknest-mobile-app-40323-40332/booknest_mobile_frontend
  - flutter pub get
  - flutter analyze
  - flutter run

CI note:
- The Flutter project is nested. Use any of the root scripts:
  - bash ./ci.sh
  - bash ./ci_entry_analyze.sh
  - bash ./ci_bootstrap.sh flutter analyze
  - bash ./tools/analyze_nested.sh
or change directory to the nested app before running flutter commands.
