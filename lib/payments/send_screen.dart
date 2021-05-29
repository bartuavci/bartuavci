import 'package:flutter/material.dart';
import 'sent_screen.dart';

import '../shared/utils.dart';
import '../shared/widgets/button.dart';
import '../shared/widgets/qr_code.dart';

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
              MyQrCode(
                imageName: 'sf.png',
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'PKR 4,646',
                style: TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () => Navigator.pushNamed(context, SentScreen.id),
                child: MyButton(
                  text: 'Send',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
