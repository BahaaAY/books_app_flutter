import 'package:bookly/constants.dart';
import 'package:bookly/core/utils/styles.dart';
import 'package:bookly/features/HomeScreen/representation/views/widgets/newest_list_view.dart';
import 'package:flutter/material.dart';
import 'custom_app_bar.dart';
import 'featured_list_view.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      physics: BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomAppBar(),
              Padding(
                padding: EdgeInsetsDirectional.only(start: mainPadding),
                child: FeaturedListView(),
              ),
              SizedBox(
                height: 32,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: mainPadding),
                child: Text(
                  "Newest",
                  style: Styles.textStyle18,
                ),
              ),
              SizedBox(
                height: 22,
              ),
            ],
          ),
        ),
        NewestBooksListView(),
      ],
    );
  }
}
