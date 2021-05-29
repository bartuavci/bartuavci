import 'package:flutter/material.dart';
import 'package:neo/shared/constant/colors.dart';
import 'package:neo/shared/constant/styles.dart';
import 'package:neo/shared/utils.dart';

import 'pie_chart.dart';

class HomeScreenMainWidget extends StatelessWidget {
  const HomeScreenMainWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      margin: EdgeInsets.only(top: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Your Balance',
            style: ConstantStyles.textStyle9,
          ),
          Text(
            'PKR 252,968',
            style: ConstantStyles.textStyle10,
          ),
          Divider(
            indent: Utils.screenWidth(context: context) / 3,
            endIndent: Utils.screenWidth(context: context) / 3,
            color: ConstantColors.darkGreen,
            height: 20,
            thickness: 2,
          ),
          Text(
            'Spent Today',
            style: ConstantStyles.textStyle9,
          ),
          Text(
            'PKR 8,990',
            style: ConstantStyles.textStyle11,
          ),
          PieChartWidget(context)
        ],
      ),
    );
  }
}
