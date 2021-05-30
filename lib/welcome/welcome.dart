import 'package:flutter/material.dart';
import '../pin/pin.dart';

import '../shared/constant/colors.dart';
import '../shared/constant/styles.dart';
import '../shared/constant/values.dart';
import '../shared/utils.dart';
import '../shared/widgets/button.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with TickerProviderStateMixin {
  bool animationCompleted = false;

  late final AnimationController _controllerLogo = AnimationController(
    duration: const Duration(seconds: 2),
    vsync: this,
  )..repeat(reverse: false);

  late final Animation<double> _animationLogo = CurvedAnimation(
    parent: _controllerLogo,
    curve: Curves.easeIn,
  );

  @override
  void initState() {
    _animationLogo.addStatusListener((status) {
      setState(() {
        if (status == AnimationStatus.completed) {
          animationCompleted = true;
        }
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    _controllerLogo.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ConstantColors.lightGreen,
      body: SafeArea(
        child: ListView(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            //Language
            buildTop(),

            //Logo
            buildLogo(context),

            // Welcome to future, login and logout
            buildRemaining(context),
          ],
        ),
      ),
    );
  }

  Widget buildRemaining(BuildContext context) {
    return Visibility(
      visible: animationCompleted,
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
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
          ),

          //Divider
          buildDivider(),
        ],
      ),
    );
  }

  Padding buildLogo(BuildContext context) {
    _controllerLogo.forward();

    return Padding(
      padding: const EdgeInsets.only(top: 84.0, bottom: 24),
      child: FadeTransition(
        opacity: _animationLogo,
        child: Image.asset(
          LOGO_IMAGE,
          alignment: Alignment.center,
          width: Utils.screenWidth(context: context) / 2,
          height: Utils.screenWidth(context: context) / 2,
        ),
      ),
    );
  }

  Widget buildDivider() {
    return Divider(
      thickness: 3,
      endIndent: 38,
      indent: 38,
      height: 200,
      color: ConstantColors.darkGreen,
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
