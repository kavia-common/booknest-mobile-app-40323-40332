# BookDetailsScreen Notes

Current behavior:
- Displays title, author, image placeholder, categories, rating (derived from popularity), and PriceTag.
- "Add to Cart" shows a SnackBar placeholder.

Navigation:
- Reached via dynamic route `/book/:id` using Routes.onGenerateRoute.

Next steps:
- Integrate CartProvider to add the selected book to the cart with quantity.
- Show related books using RecommendationService.similarByCategory.
- Add Favorite toggle using FavoritesProvider.
- Consider a persistent bottom action bar with Add-to-Cart CTA.

Run analyzer from the Flutter app root:
booknest-mobile-app-40323-40332/booknest_mobile_frontend
flutter pub get && flutter analyze
