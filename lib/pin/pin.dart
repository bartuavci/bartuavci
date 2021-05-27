import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:neo/pin/keypad.dart';
import 'package:neo/shared/constant/colors.dart';
import 'package:neo/shared/constant/styles.dart';
import 'package:local_auth/local_auth.dart';
import 'package:local_auth/error_codes.dart' as auth_error;

class PinScreen extends StatefulWidget {
  @override
  _PinScreenState createState() => _PinScreenState();
}

class _PinScreenState extends State<PinScreen> {
  TextEditingController pinController = TextEditingController();
  LocalAuthentication localAuth = LocalAuthentication();
  String currentPin = '';
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
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(
            'Error!',
            style: TextStyle(color: Colors.red),
          ),
          content: Text(
            'Your Pin contains atleast 4 digits',
            style: ConstantStyles.textStyle1,
          ),
          backgroundColor: ConstantColors.lightGreen,
          actions: [
            TextButton(
              child: const Text(
                'Ok',
                style: ConstantStyles.textStyle2,
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      );
    }
  }

  Future<bool> isAuthentionSupported() async {
    return await localAuth.canCheckBiometrics;
  }

  handleFingerPrint() async {
    try {
      bool didAuthenticate = await localAuth.authenticate(
          localizedReason: 'Please authenticate to show account balance');
      print(didAuthenticate);
    } on PlatformException catch (e) {
      if (e.code == auth_error.notAvailable) {
        // Handle this exception here.
      }
    }
  }
}
