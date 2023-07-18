import 'package:bookly/core/models/book_model/book_model.dart';
import 'package:bookly/features/HomeScreen/representation/manager/book_details_cubit/book_details_cubit.dart';
import 'package:bookly/features/HomeScreen/representation/views/widgets/book_details_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'custom_details_app_bar.dart';
import 'suggested_books_section.dart';

class DetailsViewBody extends StatefulWidget {
  const DetailsViewBody({Key? key, required this.book}) : super(key: key);
  final BookModel book;

  @override
  State<DetailsViewBody> createState() => _DetailsViewBodyState();
}

class _DetailsViewBodyState extends State<DetailsViewBody> {
  @override
  initState() {
    super.initState();
    BlocProvider.of<BookDetailsCubit>(context).fetchSimilarBooks(
        category: widget.book.volumeInfo.categories?[0] ?? '');
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Column(
            children: [
              const CustomDetailsAppBar(),
              BookDetailsSection(
                book: widget.book,
              ),
              const Expanded(
                child: SizedBox(
                  height: 50,
                ),
              ),
              const SuggestedBooksSection(),
              const SizedBox(
                height: 12,
              )
            ],
          ),
        )
      ],
    );
  }
}
