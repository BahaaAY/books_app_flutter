import 'package:bookly/constants.dart';
import 'package:bookly/core/widgets/custom_circular_indicator.dart';
import 'package:bookly/core/widgets/custom_error.dart';
import 'package:bookly/features/HomeScreen/representation/manager/newest_books_cubit/newest_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'newest_books_list_item.dart';

class NewestBooksListView extends StatelessWidget {
  const NewestBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewestBooksCubit, NewestBooksState>(
      builder: (context, state) {
        if (state is NewestBooksSuccessState) {
          return SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    GoRouter.of(context)
                        .push(detailsRoute, extra: state.books[index]);
                  },
                  child: NewestBooksListItem(
                    book: state.books[index],
                  ),
                );
              },
              childCount: state.books.length,
            ),
          );
        } else if (state is NewestBooksErrorState) {
          return SliverToBoxAdapter(child: CustomError(errorMsg: state.error));
        } else {
          return const SliverToBoxAdapter(child: CustomCircularIndicator());
        }
      },
    );
  }
}
