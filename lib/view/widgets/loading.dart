import 'package:flutter/material.dart';
import 'package:pharmadicum/core/constants/animations.dart';
import 'package:pharmadicum/core/constants/dimenesions.dart';

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: Dimensions.screenHeight(context) / 3,
        width: Dimensions.screenwidth(context) / 3,
        child: Animations.homepageloading,
      ),
    );
  }
}
