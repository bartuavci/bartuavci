import 'package:flutter/material.dart';
import '../constant/colors.dart';
import '../constant/styles.dart';

class MyTotalBalance extends StatelessWidget {
  const MyTotalBalance({
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
          'PKR $totalBalance',
          style: ConstantStyles.textStyle14,
        ),
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
