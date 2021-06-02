import 'package:flutter/material.dart';
import 'package:neo/bottom_nav_bar/bnb.dart';
import 'package:neo/shared/utils.dart';
import 'package:neo/shared/widgets/button.dart';
import 'package:neo/shared/widgets/done.dart';
import 'package:neo/shared/widgets/qr_code.dart';

class SentScreen extends StatelessWidget {
  static const id = 'Sent';
  final String amount;
  final int qrData;
  const SentScreen({
    Key? key,
    required this.amount,
    required this.qrData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Utils.myAppBar(context,
          text: id, showLeading: true, showAction: true),
      body: SingleChildScrollView(
        child: Container(
          width: double.maxFinite,
          padding: const EdgeInsets.fromLTRB(14, 70, 14, 70),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              buildQrCode(),
              buildPrice(),
              buildDone(),
              buildGoToHome(context)
            ],
          ),
        ),
      ),
    );
  }

  MyDoneWidget buildDone() => MyDoneWidget(text: 'Sent');

  Padding buildPrice() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Text(
        'PKR ' + Utils.formatNumberToPrice(number: int.parse(amount)),
        style: TextStyle(
          fontSize: 23,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  MyQrCodeWidget buildQrCode() {
    return MyQrCodeWidget(
      imageName: 'user$qrData.png',
    );
  }

  Widget buildGoToHome(BuildContext context) {
    return InkWell(
        onTap: () => Navigator.pushNamedAndRemoveUntil(
            context, BottomNavBarScreen.id, (route) => false),
        child: MyButton(
          text: 'Go to Home Screen',
          margin: EdgeInsets.only(top: 14),
        ));
  }
}
