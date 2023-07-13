import 'package:bookly/constants.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'featured_list_item.dart';

class FeaturedListView extends StatelessWidget {
  const FeaturedListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.3,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: 4,
        itemBuilder: (context, index) {
          return GestureDetector(
              onTap: () {
                GoRouter.of(context).push(detailsRoute);
              },
              child: const FeaturedListItem());
        },
        separatorBuilder: (context, index) {
          return const SizedBox(
            width: 12,
          );
        },
      ),
    );
  }
}
