# BookNest Mobile Frontend — Developer Notes

This Flutter app's project root is:
booknest-mobile-app-40323-40332/booknest_mobile_frontend

Run analyzer and tests from this directory:
- flutter analyze
- flutter test

CI hint:
Ensure the working directory for analyzer/build is set to the Flutter project root above. The message "Could not determine project root directory for Flutter project" usually means CI executed from the wrong directory.

Implemented features in this iteration:
- HomeScreen with sections:
  - Featured (horizontal list)
  - Categories (filter chips)
  - Recommended (grid)
- Reusable widgets:
  - BookCard, BookGrid, RatingStars, PriceTag, OceanButton
- Sample data and RecommendationService wired to HomeScreen
- Book details navigation using /book/:id with BookDetailsScreen placeholder

Next steps:
- Replace the BookDetailsScreen placeholder with a full details page including add-to-cart integration.
- Connect search and recommendations to a real data source when available.
