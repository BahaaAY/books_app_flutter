import 'package:bookly/constants.dart';
import 'package:bookly/core/utils/styles.dart';
import 'package:bookly/features/HomeScreen/representation/views/widgets/newest_books_list_item.dart';
import 'package:flutter/material.dart';

import 'custom_search_appbar.dart';
import 'search_text_field.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              CustomSearchAppBar(),
              SizedBox(
                height: 16,
              ),
              SearchTextField(),
              SizedBox(
                height: 16,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: mainPadding),
                child: Text(
                  "Search Result:",
                  style: Styles.textStyle18,
                ),
              ),
              SizedBox(
                height: 12,
              ),
            ],
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              //return const NewestBooksListItem();
              return Text("dummy");
            },
            childCount: 10,
          ),
        ),
      ],
    );
  }
}
