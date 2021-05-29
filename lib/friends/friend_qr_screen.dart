import 'package:flutter/material.dart';
import 'package:neo/shared/constant/styles.dart';
import 'package:neo/shared/constant/values.dart';
import 'package:neo/shared/utils.dart';
import 'package:neo/shared/widgets/button.dart';

class FriendQrScreen extends StatelessWidget {
  static const id = 'FriendQr';
  const FriendQrScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Utils.myAppBarWithCancelIcon(text: "Friends"),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(14, 70, 14, 70),
          child: Column(
            children: [
              Image.asset(
                BASE_QR_URL + 'ba.png',
                width: Utils.screenWidth(context: context) / 2,
                height: Utils.screenWidth(context: context) / 2,
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
