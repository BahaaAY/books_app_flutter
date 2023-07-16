import 'package:bookly/core/utils/styles.dart';
import 'package:bookly/core/widgets/custom_text_button.dart';
import 'package:flutter/material.dart';

import 'book_rating.dart';
import 'featured_list_item.dart';

class BookDetailsSection extends StatelessWidget {
  const BookDetailsSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.3),
          child: const FeaturedListItem(
            imgUrl: 'https://edit.org/book-covers',
          ),
        ),
        const SizedBox(
          height: 32,
        ),
        Text(
          'The First Book',
          style: Styles.textStyle30.copyWith(
            fontWeight: FontWeight.normal,
          ),
        ),
        const SizedBox(
          height: 6,
        ),
        Opacity(
          opacity: .7,
          child: Text(
            'Book Author',
            style: Styles.textStyle18.copyWith(
              fontWeight: FontWeight.w500,
              fontStyle: FontStyle.italic,
            ),
          ),
        ),
        const SizedBox(
          height: 12,
        ),
        const BookRating(
          mainAxisAlignment: MainAxisAlignment.center,
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
                  text: '19.99\$',
                  backgroundColor: Colors.white,
                ),
              ),
              Expanded(
                child: CustomButton(
                  borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(12),
                      bottomRight: Radius.circular(12)),
                  text: 'Free Preview',
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
