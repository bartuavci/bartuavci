import 'package:flutter/material.dart';
import 'package:neo/payments/api/api.dart';
import 'package:neo/payments/data/payment_list.dart';
import 'package:neo/payments/data/payments_model.dart';
import 'package:neo/payments/screens/qrcode_view_page.dart';
import 'package:neo/shared/utils.dart';
import 'package:neo/shared/widgets/button.dart';
import 'package:neo/shared/widgets/card.dart';
import 'package:neo/shared/widgets/total_balance.dart';
import 'package:neo/user/user_data.dart';

class PaymentScreen extends StatelessWidget {
  static const id = 'Payment';
  // final String _totalBalance = '220,000';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Utils.myAppBar(context, text: id, showAction: true),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 2),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            FutureBuilder(
                future: UserData().getUserId(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting)
                    return Text('Loading');
                  else {
                    if (snapshot.hasError)
                      return Text(snapshot.error.toString());
                    else
                      return buildTotalBalance(userId: snapshot.data);
                  }
                }),
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
              onTap: () {
                Navigator.pushNamed(context, QRViewPage.id);
                // Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //       builder: (context) => QRViewPage(),
                //     ));
              },
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

  Widget buildTotalBalance({Object? userId}) {
    return FutureBuilder(
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Container(child: CircularProgressIndicator());
        } else {
          if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          } else
            return MyTotalBalanceWidget(
              totalBalance: snapshot.data.toString(),
            );
        }
      },
      future: Api().getBalanceOnly(
        userId: userId.toString(),
        balanceType: UserData.balanceType[1],
      ),
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
