import 'package:bookly/core/utils/styles.dart';
import 'package:bookly/features/HomeScreen/data/models/rating_model/rating_model.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BookRating extends StatelessWidget {
  const BookRating(
      {super.key,
      this.mainAxisAlignment = MainAxisAlignment.start,
      required this.bookRating});
  final MainAxisAlignment mainAxisAlignment;
  final RatingModel bookRating;

  @override
  Widget build(BuildContext context) {
    return Row(
      //textBaseline: TextBaseline.alphabetic,
      //crossAxisAlignment: CrossAxisAlignment.baseline,
      mainAxisAlignment: mainAxisAlignment,
      children: [
        Icon(
          FontAwesomeIcons.solidStar,
          color: Color(0xffffdd4f),
          size: 14,
        ),
        SizedBox(
          width: 8,
        ),
        Text(
          bookRating.rating.toStringAsFixed(1),
          style: Styles.textStyle16,
        ),
        SizedBox(
          width: 8,
        ),
        Opacity(
          opacity: 0.5,
          child: Text(
            '(${bookRating.ratingCount})',
            style: Styles.textStyle14,
          ),
        ),
      ],
    );
  }
}
