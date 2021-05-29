import 'package:flutter/material.dart';
import 'package:neo/payments/payments_model.dart';
import 'package:neo/shared/constant/values.dart';
import 'package:neo/shared/utils.dart';
import 'package:neo/shared/widgets/button.dart';
import 'package:neo/shared/widgets/card.dart';

import 'package:neo/shared/widgets/total_balance.dart';

class PaymentsScreen extends StatelessWidget {
  static const id = 'Payment';
  final List<PaymentsModel> paymentsList = [
    PaymentsModel(
      time: 'Today',
      payments: [
        Payment(
          name: 'Food Panda',
          date: '21, March',
          imageUrl: '${BASE_PAYMENTS_URL}image_1.png',
          price: '- PKR 1,894',
        ),
        Payment(
          name: 'Bartu Avci',
          date: '21, March',
          imageUrl: '${BASE_PAYMENTS_URL}image_2.png',
          price: '- PKR 3,454',
        ),
      ],
    ),
    PaymentsModel(
      time: 'Yesterday',
      payments: [
        Payment(
          name: 'Rent',
          date: '20, March',
          imageUrl: '${BASE_PAYMENTS_URL}image_3.png',
          price: '- PKR 7,894',
        ),
        Payment(
          name: 'Travel',
          date: '20, March',
          imageUrl: '${BASE_PAYMENTS_URL}image_4.png',
          price: '- PKR 6,454',
        ),
      ],
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Utils.myAppBar(context, text: id),
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
            Expanded(
              child: ListView.builder(
                itemCount: paymentsList.length,
                itemBuilder: (BuildContext context, int index) {
                  return buildList(index);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildList(int index) {
    List<Payment> payments = paymentsList[index].payments;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          paymentsList[index].time,
          style: TextStyle(fontSize: 23),
        ),
        Column(
          children: List.generate(
            paymentsList[index].payments.length,
            (indexCard) => MyCard(
              imageUrl: payments[indexCard].imageUrl,
              title: payments[indexCard].name,
              subtitle: payments[indexCard].date,
              endText: payments[index].price,
              titleStyle: TextStyle(fontSize: 18),
              leftPadding: 16,
            ),
          ),
        )
      ],
    );
  }
}
