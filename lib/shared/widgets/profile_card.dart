import 'package:flutter/material.dart';
import '../constant/colors.dart';
import '../constant/styles.dart';
import '../utils.dart';
import 'navigate_next.dart';

class MyProfileCard extends StatelessWidget {
  final String title;
  final String subtitle;
  const MyProfileCard({
    Key? key,
    required this.title,
    required this.subtitle,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 9),
      padding: EdgeInsets.only(left: 14, right: 14),
      decoration: BoxDecoration(
        border: Border(
          left: buildBorder(color: ConstantColors.darkGreen, width: 9),
          bottom: buildBorder(),
          right: buildBorder(),
          top: buildBorder(),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                padding: EdgeInsets.only(left: 6),
                width: Utils.screenWidth(context: context) - 150,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: ConstantStyles.textStyle9,
                    ),
                    Text(
                      subtitle,
                      style: ConstantStyles.textStyleGrey1,
                    )
                  ],
                ),
              ),
            ],
          ),
          MyNavigateNext()
        ],
      ),
    );
  }

  BorderSide buildBorder({
    Color color = ConstantColors.lightGreen,
    double width = 2,
  }) {
    return BorderSide(
      color: color,
      width: width,
    );
  }
}
