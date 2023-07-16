import 'package:bookly/core/widgets/custom_circular_indicator.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomBookImage extends StatelessWidget {
  const CustomBookImage({super.key, required this.imgUrl});
  final String imgUrl;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: AspectRatio(
        aspectRatio: 0.63,
        child: CachedNetworkImage(
          placeholder: (context, url) {
            return const CustomCircularIndicator();
          },
          errorWidget: (context, url, error) {
            return const Icon(
              Icons.error_outline,
              size: 32,
            );
          },
          fit: BoxFit.fill,
          imageUrl: imgUrl,
        ),
      ),
    );
  }
}
