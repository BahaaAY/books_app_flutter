import 'package:flutter/material.dart';

import 'featured_list_item.dart';

class FeaturedListView extends StatelessWidget
{
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
            return const FeaturedListItem();
          },
        separatorBuilder: (context, index) {
            return const SizedBox(width: 12,);
        },
      ),
    );
  }
}
