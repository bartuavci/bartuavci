import 'package:flutter/material.dart';
import 'package:neo/shared/constant/values.dart';
import 'package:neo/shared/utils.dart';

class CenterImageWidget extends StatelessWidget {
  const CenterImageWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: Utils.screenWidth(context: context) / 5 + 40 + 172,
        ),
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: Utils.screenWidth(context: context) / 3),
          child: Image.asset(
            LOGO_BUBBLE_IMAGE,
            scale: Utils.screenWidth(context: context) / 24,
          ),
        ),
      ],
    );
  }
}
