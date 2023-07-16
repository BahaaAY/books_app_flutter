import 'package:bookly/core/utils/styles.dart';
import 'package:flutter/material.dart';

class CustomError extends StatelessWidget {
  final String errorMsg;
  const CustomError({super.key, required this.errorMsg});

  @override
  Widget build(BuildContext context) {
    return Text(
      errorMsg,
      style: Styles.textStyle18,
    );
  }
}
