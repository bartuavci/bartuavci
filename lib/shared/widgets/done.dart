import 'package:flutter/material.dart';
import '../constant/colors.dart';
import '../constant/styles.dart';

class MyDoneWidget extends StatelessWidget {
  final String text;
  const MyDoneWidget({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Icon(
          Icons.check_circle_outline,
          color: ConstantColors.darkGreen,
          size: 55,
        ),
        Text(
          text,
          style: ConstantStyles.textStyleGrey1,
        ),
      ],
    );
  }
}
