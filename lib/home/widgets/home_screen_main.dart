import 'package:flutter/material.dart';
import 'package:neo/payments/api/api.dart';
import 'package:neo/shared/constant/colors.dart';
import 'package:neo/shared/constant/styles.dart';
import 'package:neo/shared/utils.dart';
import 'package:neo/user/user_data.dart';

import 'pie_chart.dart';

class HomeScreenMainWidget extends StatelessWidget {
  final Object? userId;
  const HomeScreenMainWidget({
    Key? key,
    required this.userId,
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
          FutureBuilder(
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator();
              } else {
                if (snapshot.hasError) {
                  return Text(snapshot.error.toString());
                } else
                  return Text(
                    'PKR ' +
                        Utils.formatNumberToPrice(
                            number: int.parse(snapshot.data.toString())),
                    style: ConstantStyles.textStyle10,
                  );
              }
            },
            future: Api().getBalanceOnly(
              userId: userId.toString(),
              balanceType: UserData.balanceType[0],
            ),
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
