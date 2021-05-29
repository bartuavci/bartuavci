import 'package:flutter/material.dart';
import '../pin/pin.dart';

import '../shared/constant/colors.dart';
import '../shared/constant/styles.dart';
import '../shared/constant/values.dart';
import '../shared/utils.dart';
import '../shared/widgets/button.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ConstantColors.lightGreen,
      body: SafeArea(
        child: ListView(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            buildTop(),
            buildMiddle(context),
            buildDivider(),
          ],
        ),
      ),
    );
  }

  Widget buildMiddle(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 60.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          buildLogo(context),
          Text(
            'Welcome to the Future',
            textAlign: TextAlign.center,
            style: ConstantStyles.textStyle2,
          ),
          GestureDetector(
            onTap: () => Navigator.pushNamed(
              context,
              PinScreen.id,
            ),
            child: MyButton(
              margin: EdgeInsets.only(top: 30),
              text: 'LOG IN',
            ),
          ),
          MyButton(
            margin: EdgeInsets.only(top: 16),
            text: 'REGISTER',
          )
        ],
      ),
    );
  }

  Padding buildLogo(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24.0, top: 24),
      child: Image.asset(
        LOGO_IMAGE,
        alignment: Alignment.center,
        width: Utils.screenWidth(context: context) / 2,
        height: Utils.screenWidth(context: context) / 2,
      ),
    );
  }

  Widget buildDivider() {
    return Padding(
      padding: const EdgeInsets.only(top: 106, bottom: 100),
      child: Divider(
        thickness: 3,
        endIndent: 38,
        indent: 38,
        color: ConstantColors.darkGreen,
      ),
    );
  }

  Padding buildTop() {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        width: double.maxFinite,
        child: Text(
          "EN | اردو",
          style: ConstantStyles.textStyle1,
          textAlign: TextAlign.end,
        ),
      ),
    );
  }
}