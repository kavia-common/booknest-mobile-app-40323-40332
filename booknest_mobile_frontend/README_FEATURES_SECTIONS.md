# Home Sections Behavior

Featured:
- Uses RecommendationService.topPopular(limit: 6)
- Renders a horizontal ListView of BookCard
- Shows a subtle empty message if no items

Categories:
- Derived from SampleData categories + 'All'
- ChoiceChips update the current category and recompute recommendations

Recommended:
- Uses BookGrid to show either all books ('All') or those matching the selected category
- Section title switches between "Recommended for You" and "Top in <Category>"

Navigation:
- BookCard taps navigate to /book/:id via Routes.onGenerateRoute
- Quick actions (Browse All, Explore more) navigate to Routes.search

Theming:
- Ocean Professional theme with subtle surface gradient from app_theme.dart
- Reusable widgets available from lib/widgets/widgets.dart
