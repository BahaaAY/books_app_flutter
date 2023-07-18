import 'dart:math';
import 'package:bookly/core/functions/launch_custom_url.dart';
import 'package:bookly/core/utils/styles.dart';
import 'package:bookly/core/widgets/custom_text_button.dart';
import 'package:bookly/core/models/book_model/book_model.dart';
import 'package:bookly/features/HomeScreen/data/models/rating_model/rating_model.dart';
import 'package:flutter/material.dart';

import 'book_rating.dart';
import 'featured_list_item.dart';

class BookDetailsSection extends StatelessWidget {
  const BookDetailsSection({Key? key, required this.book}) : super(key: key);
  final BookModel book;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.3),
          child: FeaturedListItem(
            imgUrl: book.volumeInfo.imageLinks?.thumbnail ??
                'https://edit.org/images/cat/book-covers-big-2019101610.jpg',
          ),
        ),
        const SizedBox(
          height: 32,
        ),
        Text(
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          book.volumeInfo.title ?? 'Title not found!',
          style: Styles.textStyle30.copyWith(
            fontWeight: FontWeight.normal,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 6,
        ),
        Opacity(
          opacity: .7,
          child: Text(
            textAlign: TextAlign.center,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            getAuthors(book.volumeInfo.authors ?? List.empty()).isEmpty
                ? 'Author not Found '
                : getAuthors(book.volumeInfo.authors!),
            style: Styles.textStyle18.copyWith(
              fontWeight: FontWeight.w500,
              fontStyle: FontStyle.italic,
            ),
          ),
        ),
        const SizedBox(
          height: 12,
        ),
        BookRating(
          mainAxisAlignment: MainAxisAlignment.center,
          bookRating: RatingModel(
            rating: Random().nextDouble() * 5,
            ratingCount: 1 + Random().nextInt(1000),
          ),
        ),
        const SizedBox(
          height: 38,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 38),
          child: Row(
            children: [
              Expanded(
                child: CustomButton(
                  textStyle: Styles.textStyle18.copyWith(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(12),
                      bottomLeft: Radius.circular(12)),
                  text: 'Free',
                  backgroundColor: Colors.white,
                ),
              ),
              Expanded(
                child: CustomButton(
                  onPressed: () {
                    launchCustomUrl(context, book.volumeInfo.previewLink);
                  },
                  borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(12),
                      bottomRight: Radius.circular(12)),
                  text: getPreviewText(
                      bookPreviewLink: book.volumeInfo.previewLink),
                  backgroundColor: const Color(0XFFef8262),
                  textStyle: Styles.textStyle16.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

String getPreviewText({String? bookPreviewLink}) {
  if (bookPreviewLink == null) {
    return 'No Preview';
  } else {
    return 'Preview';
  }
}

String getAuthors(List<String> authors) {
  String authorsFull = '';
  for (String author in authors) {
    authorsFull = '$authorsFull$author, ';
  }
  authorsFull = authorsFull.substring(0, authorsFull.length - 2);
  return authorsFull;
}
