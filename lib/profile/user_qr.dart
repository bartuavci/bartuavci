import 'package:flutter/material.dart';
import 'package:neo/shared/constant/styles.dart';
import 'package:neo/shared/constant/values.dart';
import 'package:neo/shared/utils.dart';
import 'package:neo/shared/widgets/button.dart';

class UserQrScreen extends StatelessWidget {
  static const id = 'UserQr';
  const UserQrScreen({Key? key}) : super(key: key);

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
                BASE_QR_URL + 'ma.png',
                width: Utils.screenWidth(context: context) / 2,
                height: Utils.screenWidth(context: context) / 2,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'M Akbar ',
                style: TextStyle(fontSize: 22),
              ),
              Text(
                '@Akbar6584',
                style: ConstantStyles.textStyleGrey3,
              ),
              SizedBox(
                height: 70,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MyButton(
                    text: 'Share',
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
