import 'package:flutter/material.dart';
import 'package:neo/bottom_nav_bar/bnb.dart';
import 'package:neo/pin/biomethric_auth.dart';
import 'package:neo/pin/keypad.dart';
import 'package:neo/shared/constant/colors.dart';
import 'package:neo/shared/constant/styles.dart';
import 'package:local_auth/local_auth.dart';
import 'package:neo/shared/utils.dart';

class PinScreen extends StatefulWidget {
  static const id = 'Pin';
  @override
  _PinScreenState createState() => _PinScreenState();
}

class _PinScreenState extends State<PinScreen> {
  TextEditingController pinController = TextEditingController();

  String currentPin = '';
  String autherized = "Not autherized";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ConstantColors.lightGreen,
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Container(
          width: double.maxFinite,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 50.0, bottom: 6),
                child: Text(
                  'Use fingerprint or enter PIN',
                  style: ConstantStyles.textStyle3,
                ),
              ),
              Text(
                'Your PIN contains atleast 4 digits',
                style: ConstantStyles.textStyle4,
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                currentPin,
                style: ConstantStyles.textStyle6,
              ),
              KeyPad(
                pinController: pinController,
                isPinLogin: false,
                onChange: (String pin) {
                  handleChange(pin: pin);
                },
                onSubmit: (String pin) {
                  handleSubmit(pin: pin);
                },
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30, bottom: 50),
                child: GestureDetector(
                  onTap: () => handleFingerPrint(),
                  child: Container(
                    height: 60,
                    width: 60,
                    child: Center(
                      child: Icon(
                        Icons.fingerprint,
                        size: 55,
                        color: ConstantColors.darkGreen,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void handleChange({required String pin}) {
    setState(() {
      currentPin = pin;
    });
  }

  void handleSubmit({required String pin}) {
    if (pin.length < 4) {
      Utils.myErrorDialog(
          context: context, message: "Pin should contains atleast 4 digits");
    } else
      navigateToNextScreen();
  }

  handleFingerPrint() async {
    BiometricAuth biometricAuth = BiometricAuth(context: context);
    if (await biometricAuth.checkBiometric()) {
      biometricAuth.getAvailableBiometrics().then(
            (value) => value.contains(BiometricType.fingerprint)
                ? biometricAuth.authenticate().then(
                      (value) => value
                          ? navigateToNextScreen()
                          : print('Not Authenticated'),
                    )
                : Utils.myErrorDialog(
                    context: context,
                    message: 'Biometric authentication is not available!',
                  ),
          );
    } else {
      Utils.myErrorDialog(
          context: context,
          message: 'Local authentication is not availabe in this devices');
    }
  }

  void navigateToNextScreen() {
    Navigator.pushNamed(context, BottomNavBarScreen.id);
  }
}
