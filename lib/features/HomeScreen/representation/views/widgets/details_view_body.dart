import 'package:bookly/constants.dart';
import 'package:flutter/material.dart';

import 'custom_details_app_bar.dart';

class DetailsViewBody extends StatelessWidget {
  const DetailsViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: const [
          CustomDetailsAppBar()
        ],
      ),
    );
  }
}

