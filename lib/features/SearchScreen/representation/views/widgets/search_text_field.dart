import 'package:bookly/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({
    super.key,
    this.onChanged,
  });
  final void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: mainPadding),
      child: TextField(
        onChanged: onChanged,
        decoration: InputDecoration(
          hintText: 'Book Title?',
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.white,
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.white,
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          suffixIcon: const Opacity(
            opacity: 0.7,
            child: Icon(
              FontAwesomeIcons.magnifyingGlass,
              size: 18,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
