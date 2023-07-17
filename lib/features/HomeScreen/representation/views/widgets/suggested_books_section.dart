import 'package:bookly/constants.dart';
import 'package:bookly/core/utils/styles.dart';
import 'package:bookly/core/widgets/custom_circular_indicator.dart';
import 'package:bookly/core/widgets/custom_error.dart';
import 'package:bookly/features/HomeScreen/representation/manager/book_details_cubit/book_details_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'featured_list_item.dart';

class SuggestedBooksSection extends StatelessWidget {
  const SuggestedBooksSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BookDetailsCubit, BookDetailsState>(
      builder: (context, state) {
        if (state is BookDetailsSuccessState) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: mainPadding),
                child: Text(
                  'You may also like:',
                  style: Styles.textStyle14.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Padding(
                padding: const EdgeInsetsDirectional.only(start: mainPadding),
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.15,
                  child: ListView.separated(
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: state.books.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                          onTap: () {
                            GoRouter.of(context).pushReplacement(detailsRoute,
                                extra: state.books[index]);
                          },
                          child: FeaturedListItem(
                            imgUrl: state.books[index].volumeInfo.imageLinks
                                    ?.thumbnail ??
                                'https://edit.org/images/cat/book-covers-big-2019101610.jpg',
                          ));
                    },
                    separatorBuilder: (context, index) {
                      return const SizedBox(
                        width: 10,
                      );
                    },
                  ),
                ),
              ),
            ],
          );
        } else if (state is BookDetailsErrorState) {
          return CustomError(errorMsg: state.error);
        } else {
          return const CustomCircularIndicator();
        }
      },
    );
  }
}
