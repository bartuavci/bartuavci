import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:neo/shared/constant/colors.dart';
import 'package:neo/shared/constant/styles.dart';
import 'package:neo/shared/utils.dart';

class PieChartWidget extends StatelessWidget {
  final BuildContext context;
  const PieChartWidget(
    this.context, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      child: PieChart(PieChartData(
          centerSpaceRadius: Utils.screenWidth(context: context) / 5,
          startDegreeOffset: -140,
          sectionsSpace: 3,
          sections: [
            buildPieChartSection(title: "Careem", value: 300),
            buildPieChartSection(title: "Food Panda", value: 3105),
            buildPieChartSection(title: "Springs", value: 1150),
            buildPieChartSection(title: "Ufone", value: 4435),
          ])),
    );
  }

  PieChartSectionData buildPieChartSection({
    required double value,
    required String title,
  }) {
    return PieChartSectionData(
      color: ConstantColors.pieChartColor,
      value: value,
      radius: 40,
      showTitle: false,
      badgePositionPercentageOffset: 1.8,
      badgeWidget: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            title,
            style: ConstantStyles.textStyleGrey2,
          ),
          Text(
            "PKR " + value.toString(),
            style: ConstantStyles.textStyle7,
          ),
        ],
      ),
    );
  }
}
