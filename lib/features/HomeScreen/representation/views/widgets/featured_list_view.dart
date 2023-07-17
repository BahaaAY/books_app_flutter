import 'package:bookly/constants.dart';
import 'package:bookly/core/widgets/custom_circular_indicator.dart';
import 'package:bookly/core/widgets/custom_error.dart';
import 'package:bookly/features/HomeScreen/representation/manager/featured_books_cubit/featured_books_cubit.dart';
import 'package:bookly/features/HomeScreen/representation/manager/featured_books_cubit/featured_books_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'featured_list_item.dart';

class FeaturedListView extends StatelessWidget {
  const FeaturedListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeaturedBooksCubit, FeaturedBooksState>(
      builder: (context, state) {
        if (state is FeaturedBooksSuccessState) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * 0.3,
            child: ListView.separated(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: state.books.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                    onTap: () {
                      GoRouter.of(context)
                          .push(detailsRoute, extra: state.books[index]);
                    },
                    child: FeaturedListItem(
                      imgUrl: state
                              .books[index].volumeInfo.imageLinks?.thumbnail ??
                          'https://edit.org/images/cat/book-covers-big-2019101610.jpg',
                    ));
              },
              separatorBuilder: (context, index) {
                return const SizedBox(
                  width: 12,
                );
              },
            ),
          );
        } else if (state is FeaturedBooksErrorState) {
          return CustomError(errorMsg: state.error);
        } else {
          return const CustomCircularIndicator();
        }
      },
    );
  }
}
