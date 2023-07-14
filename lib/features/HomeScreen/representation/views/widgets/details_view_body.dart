import 'package:bookly/constants.dart';
import 'package:bookly/core/utils/styles.dart';
import 'package:bookly/features/HomeScreen/representation/views/widgets/book_details_section.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'custom_details_app_bar.dart';
import 'featured_list_item.dart';
import 'suggested_books_section.dart';

class DetailsViewBody extends StatelessWidget {
  const DetailsViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Column(
            children: const [
              CustomDetailsAppBar(),
              BookDetailsSection(),
              Expanded(
                child: SizedBox(
                  height: 50,
                ),
              ),
              SuggestedBooksSection(),
              SizedBox(
                height: 12,
              )
            ],
          ),
        )
      ],
    );
  }
}
