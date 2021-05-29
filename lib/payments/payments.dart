import 'package:flutter/material.dart';
import 'package:neo/payments/payments_model.dart';
import 'package:neo/shared/constant/values.dart';
import 'package:neo/shared/utils.dart';
import 'package:neo/shared/widgets/button.dart';

import 'package:neo/shared/widgets/total_balance.dart';

class PaymentsScreen extends StatelessWidget {
  static const id = 'Payment';
  final List<PaymentsModel> paymentsListToday = [
    PaymentsModel(
        title: 'Food Panda',
        date: '21, March',
        amount: '- PKR 1,894',
        imageUrl: '${BASE_PAYMENTS_URL}image_1.png'),
    PaymentsModel(
        title: 'Bartu Avci',
        date: '21, March',
        amount: '- PKR 3,454',
        imageUrl: '${BASE_PAYMENTS_URL}image_2.png'),
  ];

  final List<PaymentsModel> paymentListYesterday = [
    PaymentsModel(
        title: 'Rent',
        date: '20, March',
        amount: '- PKR 7,894',
        imageUrl: '${BASE_PAYMENTS_URL}image_3.png'),
    PaymentsModel(
        title: 'Travel',
        date: '20, March',
        amount: '- PKR 6,454',
        imageUrl: '${BASE_PAYMENTS_URL}image_4.png')
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Utils.myAppBar(text: id),
      body: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            MyTotalBalance(
              totalBalance: '220,000',
            ),
            Row(
              children: <Widget>[
                Expanded(
                  flex: 10,
                  child: MyButton(
                    margin: EdgeInsets.all(0),
                    text: 'Receive',
                  ),
                ),
                Spacer(
                  flex: 1,
                ),
                Expanded(
                  flex: 10,
                  child: MyButton(
                    margin: EdgeInsets.all(0),
                    text: 'Send',
                  ),
                ),
              ],
            ),
            Text('Today'),
          ],
        ),
      ),
    );
  }
}
