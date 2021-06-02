import 'package:flutter/material.dart';
import 'package:neo/shared/utils.dart';
import 'package:neo/shared/widgets/button.dart';
import 'package:neo/shared/widgets/qr_code.dart';
import 'sent_screen.dart';

class SendScreen extends StatelessWidget {
  static const id = 'Send';
  const SendScreen({Key? key}) : super(key: key);

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
              buildSendButton(context),
            ],
          ),
        ),
      ),
    );
  }

  GestureDetector buildSendButton(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, SentScreen.id);
      },
      child: MyButton(
        text: 'Send',
      ),
    );
  }

  Padding buildPrice() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Text(
        'PKR 4,646',
        style: TextStyle(
          fontSize: 23,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  MyQrCodeWidget buildQrCode() {
    return MyQrCodeWidget(
      imageName: 'user3.png',
    );
  }
}
