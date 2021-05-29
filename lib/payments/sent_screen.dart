import 'package:flutter/material.dart';

import '../shared/utils.dart';
import '../shared/widgets/done.dart';
import '../shared/widgets/qr_code.dart';

class SentScreen extends StatelessWidget {
  static const id = 'Sent';
  const SentScreen({Key? key}) : super(key: key);

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
              MyDoneWidget(text: 'Sent')
            ],
          ),
        ),
      ),
    );
  }
}
