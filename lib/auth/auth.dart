import 'package:flutter/material.dart';

import 'package:neo/shared/constant/colors.dart';
import 'package:neo/shared/constant/styles.dart';
import 'package:neo/shared/constant/values.dart';
import 'package:neo/shared/utils.dart';
import 'package:neo/shared/widgets/button.dart';

class AuthScreen extends StatelessWidget {
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
              ROUTE_PIN,
            ),
            child: MyButton(
              edgeInsets: EdgeInsets.only(top: 30),
              text: 'LOG IN',
            ),
          ),
          MyButton(
            edgeInsets: EdgeInsets.only(top: 16),
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
