import 'package:bookly/constants.dart';
import 'package:bookly/core/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class FeaturedListItem extends StatelessWidget {
  const FeaturedListItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        GoRouter.of(context).push(detailsRoute);
      },
      child: Stack(
        alignment: Alignment.bottomRight,
        children: [
          AspectRatio(
            aspectRatio: 0.63,
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.0),
                  image: const DecorationImage(
                      image: AssetImage(AssetsData.testImage),
                      fit: BoxFit.fill)),
            ),
          ),
          /**Container(
            width: 46,
            margin: const EdgeInsets.all(4),
            child: FloatingActionButton(
              backgroundColor: primaryColor,

              child: const Icon(
                FontAwesomeIcons.bookOpenReader,
                size: 23,
                color: Colors.white,
              ),
              onPressed: () {},
            ),
          ),**/
        ],
      ),
    );
  }
}
