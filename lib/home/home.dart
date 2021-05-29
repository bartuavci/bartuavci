import 'package:flutter/material.dart';
import '../shared/constant/colors.dart';
import '../shared/constant/styles.dart';
import 'package:fl_chart/fl_chart.dart';
import '../shared/constant/values.dart';
import '../shared/utils.dart';

class HomeScreen extends StatelessWidget {
  static const id = 'Home';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ConstantColors.lightGreen,
      appBar: Utils.myAppBar(context,
          text: id,
          backgroundColor: ConstantColors.lightGreen,
          showAction: true),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            HomeScreenMain(),
            CenterImage(),
          ],
        ),
      ),
    );
  }
}

class CenterImage extends StatelessWidget {
  const CenterImage({
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

class HomeScreenMain extends StatelessWidget {
  const HomeScreenMain({
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
