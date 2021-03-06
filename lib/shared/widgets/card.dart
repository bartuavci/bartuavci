import 'package:flutter/material.dart';
import '../constant/colors.dart';
import '../constant/styles.dart';

class MyCardWidget extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String subtitle;
  final String endText;
  final double leftPadding;
  final double rightPadding;
  final TextStyle titleStyle;
  final double verticalMargin;
  const MyCardWidget({
    Key? key,
    required this.imageUrl,
    required this.title,
    required this.subtitle,
    required this.endText,
    this.leftPadding = 0,
    this.rightPadding = 6,
    this.titleStyle = ConstantStyles.textStyle9,
    this.verticalMargin = 9,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: verticalMargin),
      padding: EdgeInsets.only(left: leftPadding, right: rightPadding),
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
              Image.asset(
                imageUrl,
                width: 50,
                height: 50,
              ),
              Container(
                padding: EdgeInsets.only(left: 6),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: titleStyle,
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
          Text(
            endText,
          )
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
