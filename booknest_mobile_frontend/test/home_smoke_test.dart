import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:booknest_mobile_frontend/widgets/book_card.dart' as local_book_card;
import 'package:booknest_mobile_frontend/widgets/price_tag.dart' as local_price_tag;
import 'package:booknest_mobile_frontend/widgets/rating_stars.dart' as local_rating_stars;
import 'package:booknest_mobile_frontend/widgets/book_grid.dart' as local_book_grid;
import 'package:booknest_mobile_frontend/models/book.dart';

void main() {
  testWidgets('BookCard builds', (tester) async {
    final book = Book(
      id: 't1',
      title: 'Test Book',
      author: 'Test Author',
      price: 10.0,
      categories: const ['Test'],
      popularity: 50,
    );

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: local_book_card.BookCard(book: book),
        ),
      ),
    );

    expect(find.text('Test Book'), findsOneWidget);
    expect(find.text('Test Author'), findsOneWidget);
  });

  testWidgets('PriceTag builds', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: local_price_tag.PriceTag(price: 12.34),
        ),
      ),
    );
    expect(find.byType(local_price_tag.PriceTag), findsOneWidget);
  });

  testWidgets('RatingStars builds', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: local_rating_stars.RatingStars(rating: 4.5),
        ),
      ),
    );
    expect(find.byType(local_rating_stars.RatingStars), findsOneWidget);
  });

  testWidgets('BookGrid builds with empty list', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: CustomScrollView(
            slivers: [
              local_book_grid.BookGrid(books: []),
            ],
          ),
        ),
      ),
    );

    expect(find.byType(local_book_grid.BookGrid), findsOneWidget);
  });
}
