import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget
{
  const CustomButton(
      {Key? key,
        this.backgroundColor = Colors.white,
        this.borderRadius,
        required this.text,
        required this.textStyle})
      : super(key: key);

  final Color backgroundColor;
  final String text;
  final TextStyle textStyle;

  final BorderRadius? borderRadius;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: TextButton(
        style: TextButton.styleFrom(
            backgroundColor: backgroundColor,
            shape: RoundedRectangleBorder(
              borderRadius: borderRadius ?? BorderRadius.circular(12),
            )),
        onPressed: () {},
        child: Text(
          text,
          style: textStyle,
        ),
      ),
    );
  }
}
