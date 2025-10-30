# HomeScreen Overview

Sections implemented:
- Featured: Horizontal list using RecommendationService.topPopular() rendered with BookCard.
- Categories: Horizontal ChoiceChips derived from SampleData categories. Selecting refines recommendations.
- Recommended: Grid of books via BookGrid based on selected category (or all when 'All' selected).

Data & Services:
- Sample data in lib/services/sample_data.dart
- Recommendation logic in lib/services/recommendation_service.dart

Navigation:
- Tapping a BookCard navigates to: /book/:id (dynamic route)
- Routes are managed in lib/core/routes.dart (onGenerateRoute handles /book/:id)
- Quick actions navigate to Search via Routes.search

UI Components:
- Reusable widgets live in lib/widgets/ (also available via lib/widgets/widgets.dart barrel)
- Theme & gradient: lib/theme/app_theme.dart

Where to add features next:
- Enhance BookDetailsScreen (lib/screens/book_details_screen.dart) to integrate CartProvider.
- Expand SearchScreen with SearchService to show results using BookGrid.
- Add order history and checkout flows incrementally.

Analyzer/Build note:
Run all Flutter commands from:
booknest-mobile-app-40323-40332/booknest_mobile_frontend

Examples:
- flutter pub get
- flutter analyze
- flutter test
- flutter run
