import 'package:bookly/features/HomeScreen/representation/views/widgets/featured_list_item.dart';
import 'package:flutter/material.dart';

import 'custom_details_app_bar.dart';

class DetailsViewBody extends StatelessWidget {
  const DetailsViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Column(
        children:  [
          const CustomDetailsAppBar(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: width*0.27),
            child: const FeaturedListItem(),
          ),

        ],
      ),
    );
  }
}

