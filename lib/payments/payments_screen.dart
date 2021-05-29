import 'package:flutter/material.dart';
import 'data/payment_list.dart';
import 'payments_model.dart';
import 'send_screen.dart';
import '../shared/utils.dart';
import '../shared/widgets/button.dart';
import '../shared/widgets/card.dart';

import '../shared/widgets/total_balance.dart';

class PaymentsScreen extends StatelessWidget {
  static const id = 'Payment';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Utils.myAppBar(context, text: id, showAction: true),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            buildTotalBalance(),
            buildButtons(context),
            buildListView(),
          ],
        ),
      ),
    );
  }

  Expanded buildListView() {
    return Expanded(
      child: ListView.builder(
        itemCount: paymentsList.length,
        itemBuilder: (BuildContext context, int index) {
          return buildList(index);
        },
      ),
    );
  }

  Padding buildButtons(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 10,
            child: MyButton(
              margin: EdgeInsets.all(0),
              text: 'Receive',
              borderRadius: 9,
            ),
          ),
          Spacer(
            flex: 1,
          ),
          Expanded(
            flex: 10,
            child: GestureDetector(
              onTap: () => Navigator.pushNamed(context, SendScreen.id),
              child: MyButton(
                margin: EdgeInsets.all(0),
                borderRadius: 9,
                text: 'Send',
              ),
            ),
          ),
        ],
      ),
    );
  }

  MyTotalBalanceWidget buildTotalBalance() {
    return MyTotalBalanceWidget(
      totalBalance: '220,000',
    );
  }

  Widget buildList(int index) {
    List<Payment> payments = paymentsList[index].payments;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 30, bottom: 12),
          child: Text(
            paymentsList[index].time,
            style: TextStyle(fontSize: 23),
          ),
        ),
        Column(
          children: List.generate(
            paymentsList[index].payments.length,
            (indexCard) => MyCardWidget(
              imageUrl: payments[indexCard].imageUrl,
              title: payments[indexCard].name,
              subtitle: payments[indexCard].date,
              endText: payments[index].price,
              titleStyle: TextStyle(fontSize: 18),
              leftPadding: 16,
              verticalMargin: 4,
            ),
          ),
        )
      ],
    );
  }
}
