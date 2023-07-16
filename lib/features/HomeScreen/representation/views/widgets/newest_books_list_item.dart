import 'dart:math';

import 'package:bookly/constants.dart';
import 'package:bookly/core/utils/assets.dart';
import 'package:bookly/core/utils/styles.dart';
import 'package:bookly/features/HomeScreen/data/models/book_model/book_model.dart';
import 'package:bookly/features/HomeScreen/data/models/rating_model/rating_model.dart';
import 'package:bookly/features/HomeScreen/representation/views/widgets/custom_book_image.dart';
import 'package:flutter/material.dart';

import 'book_rating.dart';

class NewestBooksListItem extends StatelessWidget {
  const NewestBooksListItem({
    super.key,
    required this.book,
  });
  final BookModel book;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.symmetric(horizontal: mainPadding, vertical: 10),
      child: SizedBox(
        height: 100,
        child: Row(
          children: [
            CustomBookImage(imgUrl: book.volumeInfo.imageLinks.thumbnail),
            const SizedBox(
              width: 30,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    book.volumeInfo.title!,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: Styles.textStyle20.copyWith(
                      fontFamily: fontGtSectraFine,
                    ),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(
                    getAuthors(book.volumeInfo.authors!),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Styles.textStyle14,
                  ),
                  const Spacer(),
                  Row(
                    textBaseline: TextBaseline.alphabetic,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    children: [
                      Text(
                        'Free',
                        style: Styles.textStyle20.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Spacer(),
                      BookRating(
                        bookRating: RatingModel(
                          rating: 4 + Random().nextDouble() * 1,
                          ratingCount: 500 + Random().nextInt(501),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  String getAuthors(List<String> authors) {
    String authorsFull = '';
    for (String author in authors) {
      authorsFull = '$authorsFull$author, ';
    }
    authorsFull = authorsFull.substring(0, authorsFull.length - 2);
    return authorsFull;
  }
}
