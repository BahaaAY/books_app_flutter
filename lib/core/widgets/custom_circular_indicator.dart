import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class CustomCircularIndicator extends StatelessWidget {
  const CustomCircularIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: const CircularProgressIndicator());
  }
}
