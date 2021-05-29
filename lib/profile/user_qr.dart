import 'package:flutter/material.dart';
import '../shared/constant/styles.dart';
import '../shared/utils.dart';
import '../shared/widgets/button.dart';
import '../shared/widgets/qr_code.dart';

class UserQrScreen extends StatelessWidget {
  static const id = 'UserQr';
  const UserQrScreen({Key? key}) : super(key: key);

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
                imageName: 'ma.png',
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
