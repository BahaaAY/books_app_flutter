import 'package:bookly/core/utils/assets.dart';
import 'package:flutter/material.dart';

class FeaturedListItem extends StatelessWidget {
  const FeaturedListItem({
    super.key,
    required this.imgUrl,
  });
  final String imgUrl;
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        AspectRatio(
          aspectRatio: 0.63,
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.0),
                image: DecorationImage(
                    image: NetworkImage(imgUrl), fit: BoxFit.fill)),
          ),
        ),
      ],
    );
  }
}
