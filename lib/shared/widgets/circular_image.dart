import 'package:flutter/material.dart';

import 'package:neo/shared/constant/colors.dart';
import 'package:neo/shared/constant/values.dart';

class MyCircularImage extends StatelessWidget {
  final double allMargin;
  const MyCircularImage({
    Key? key,
    this.allMargin = 14,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(allMargin),
      width: 58,
      height: 58,
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
