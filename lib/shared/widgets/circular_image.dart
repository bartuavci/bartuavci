import 'package:flutter/material.dart';

import '../constant/colors.dart';
import '../constant/values.dart';

class MyCircularImage extends StatelessWidget {
  final double allMargin;
  final double width;
  final double height;
  const MyCircularImage({
    Key? key,
    this.allMargin = 14,
    this.width = 58,
    this.height = 58,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(allMargin),
      width: height,
      height: width,
      decoration: BoxDecoration(
        border: Border.all(
          color: ConstantColors.darkGreen,
          width: 3,
        ),
        shape: BoxShape.circle,
        image: DecorationImage(
          image: AssetImage(
            '${BASE_USERS_URL}user_1.jpg',
          ),
        ),
      ),
    );
  }
}
