import 'package:flutter/material.dart';

class SlidingFadeInText extends StatelessWidget {
  const SlidingFadeInText({
    super.key,
    required this.fadeInAnim,
    required this.slidingAnim,
  });

  final Animation<double> fadeInAnim;
  final Animation<Offset> slidingAnim;

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: fadeInAnim,
      child: SlideTransition(
        position: slidingAnim,
        child: const Text(
          'Free Books Resource',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
