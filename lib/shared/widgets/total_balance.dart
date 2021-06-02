import 'package:flutter/material.dart';
import 'package:neo/shared/utils.dart';
import '../constant/colors.dart';
import '../constant/styles.dart';

class MyTotalBalanceWidget extends StatelessWidget {
  const MyTotalBalanceWidget({
    Key? key,
    required this.totalBalance,
  }) : super(key: key);
  final String totalBalance;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'PKR ' +
              Utils.formatNumberToPrice(number: int.parse(totalBalance))
                  .toString(),
          style: ConstantStyles.textStyle14,
        ),
        SizedBox(height: 4),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Icon(
                Icons.visibility_rounded,
                color: ConstantColors.gray1,
              ),
            ),
            Text(
              'Total Balance',
              style: ConstantStyles.textStyleGrey2,
            )
          ],
        )
      ],
    );
  }
}
