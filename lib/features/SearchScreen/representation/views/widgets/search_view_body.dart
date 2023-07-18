import 'package:bookly/constants.dart';
import 'package:bookly/core/utils/styles.dart';
import 'package:bookly/core/widgets/custom_circular_indicator.dart';
import 'package:bookly/core/widgets/custom_error.dart';
import 'package:bookly/features/HomeScreen/representation/views/widgets/newest_books_list_item.dart';
import 'package:bookly/features/SearchScreen/data/manager/search_cubit/search_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'custom_search_appbar.dart';
import 'search_text_field.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<SearchCubit>(context);

    return BlocBuilder<SearchCubit, SearchState>(builder: (context, state) {
      return CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: <Widget>[
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CustomSearchAppBar(),
                const SizedBox(
                  height: 16,
                ),
                SearchTextField(
                  onChanged: (String text) {
                    print('Query: $text');
                    cubit.searchBooks(query: text);
                  },
                ),
                Builder(builder: (contex) {
                  if (state is SearchSuccessState) {
                    return const Column(
                      children: [
                        SizedBox(
                          height: 16,
                        ),
                        Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: mainPadding),
                          child: Text(
                            "Search Result:",
                            style: Styles.textStyle18,
                          ),
                        ),
                        SizedBox(
                          height: 12,
                        ),
                      ],
                    );
                  } else {
                    return Container();
                  }
                })
              ],
            ),
          ),
          Builder(
            builder: (context) {
              if (state is SearchInitial) {
                return const SliverToBoxAdapter(
                  child: SizedBox(
                    height: 0,
                    width: 0,
                  ),
                );
              } else if (state is SearchSuccessState) {
                return SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () {
                          GoRouter.of(context).pushReplacement(detailsRoute,
                              extra: state.books[index]);
                        },
                        child: NewestBooksListItem(
                          book: state.books[index],
                        ),
                      );
                    },
                    childCount: state.books.length,
                  ),
                );
              } else if (state is SearchLoadingState) {
                return const SliverFillRemaining(
                    child: CustomCircularIndicator());
              } else {
                return const SliverFillRemaining(
                    child: CustomError(errorMsg: 'No Results Found!'));
              }
            },
          ),
        ],
      );
    });
  }
}
