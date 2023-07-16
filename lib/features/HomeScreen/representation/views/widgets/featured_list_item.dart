import 'package:bookly/features/HomeScreen/representation/views/widgets/custom_book_image.dart';
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
        CustomBookImage(imgUrl: imgUrl),
      ],
    );
  }
}
