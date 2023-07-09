import 'package:bookly/constants.dart';
import 'package:bookly/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'best_seller_item.dart';
import 'custom_app_bar.dart';
import 'featured_list_view.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        CustomAppBar(),
        FeaturedListView(),
        SizedBox(
          height: 32,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: homePadding),
          child: Text(
            "Best Seller",
            style: Styles.textStyle18,
          ),
        ),
        SizedBox(
          height: 22,
        ),
        BestSellerItem(),
      ],
    );
  }
}
