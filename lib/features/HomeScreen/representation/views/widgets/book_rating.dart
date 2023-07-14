import 'package:bookly/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BookRating extends StatelessWidget {
  const BookRating(
      {super.key, this.mainAxisAlignment = MainAxisAlignment.start});
  final MainAxisAlignment mainAxisAlignment;

  @override
  Widget build(BuildContext context) {
    return Row(
      //textBaseline: TextBaseline.alphabetic,
      //crossAxisAlignment: CrossAxisAlignment.baseline,
      mainAxisAlignment: mainAxisAlignment,
      children: const [
        Icon(
          FontAwesomeIcons.solidStar,
          color: Color(0xffffdd4f),
          size: 14,
        ),
        SizedBox(
          width: 8,
        ),
        Text(
          '4.8',
          style: Styles.textStyle16,
        ),
        SizedBox(
          width: 8,
        ),
        Opacity(
          opacity: 0.5,
          child: Text(
            '(245)',
            style: Styles.textStyle14,
          ),
        ),
      ],
    );
  }
}
