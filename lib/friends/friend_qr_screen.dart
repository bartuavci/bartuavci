import 'package:flutter/material.dart';

import '../shared/constant/styles.dart';
import '../shared/utils.dart';
import '../shared/widgets/button.dart';
import '../shared/widgets/qr_code.dart';

class FriendQrScreen extends StatelessWidget {
  static const id = 'FriendQr';
  const FriendQrScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Utils.myAppBar(
        context,
        text: "Friends",
        showLeading: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(14, 70, 14, 70),
          child: Column(
            children: [
              MyQrCode(
                imageName: 'ba.png',
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Bartu Avci ',
                style: TextStyle(fontSize: 22),
              ),
              Text(
                '@Bartu5746',
                style: ConstantStyles.textStyleGrey3,
              ),
              Text('+9232182764537', style: ConstantStyles.textStyleGrey3),
              SizedBox(
                height: 70,
              ),
              Row(
                children: [
                  Expanded(
                    flex: 9,
                    child: MyButton(
                      text: 'Send',
                    ),
                  ),
                  Spacer(
                    flex: 1,
                  ),
                  Expanded(
                    flex: 9,
                    child: MyButton(
                      text: 'Request',
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
