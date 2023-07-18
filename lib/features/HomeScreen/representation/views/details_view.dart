import 'package:bookly/core/models/book_model/book_model.dart';
import 'package:bookly/features/HomeScreen/representation/views/widgets/details_view_body.dart';
import 'package:flutter/material.dart';

class DetailsView extends StatefulWidget {
  const DetailsView({Key? key, required this.book}) : super(key: key);
  final BookModel book;

  @override
  State<DetailsView> createState() => _DetailsViewState();
}

class _DetailsViewState extends State<DetailsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: DetailsViewBody(
        book: widget.book,
      )),
    );
  }
}
