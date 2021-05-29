import 'package:flutter/material.dart';
import 'package:neo/shared/constant/colors.dart';

class MyNavigateNext extends StatelessWidget {
  const MyNavigateNext({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      width: 45,
      decoration: BoxDecoration(
        color: ConstantColors.darkGreen,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Icon(
        Icons.navigate_next_sharp,
        color: ConstantColors.white,
      ),
    );
  }
}
