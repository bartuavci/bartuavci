import 'package:flutter/material.dart';
import 'package:neo/user/user_data.dart';
import 'package:neo/user/user_model.dart';
import '../bottom_nav_bar/bnb.dart';
import 'biomethric_auth.dart';
import 'keypad.dart';
import '../shared/constant/colors.dart';
import '../shared/constant/styles.dart';
import 'package:local_auth/local_auth.dart';
import '../shared/utils.dart';

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
      appBar: AppBar(
        backgroundColor: ConstantColors.lightGreen,
      ),
      body: SingleChildScrollView(
        child: Container(
          width: double.maxFinite,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              buildInfo1(),
              buildInfo2(),
              buildSpace(),
              buildEnteredPin(),
              buildKeyPad(),
              buildFingerPrint(),
            ],
          ),
        ),
      ),
    );
  }

  Text buildInfo2() {
    return Text(
      'Your PIN contains atleast 4 digits',
      style: ConstantStyles.textStyle4,
    );
  }

  Padding buildInfo1() {
    return Padding(
      padding: const EdgeInsets.only(top: 50.0, bottom: 6),
      child: Text(
        'Use fingerprint or enter PIN',
        style: ConstantStyles.textStyle3,
      ),
    );
  }

  SizedBox buildSpace() {
    return SizedBox(
      height: 30,
    );
  }

  Text buildEnteredPin() {
    return Text(
      currentPin,
      style: ConstantStyles.textStyle6,
    );
  }

  Padding buildFingerPrint() {
    return Padding(
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
    );
  }

  KeyPad buildKeyPad() {
    return KeyPad(
      pinController: pinController,
      isPinLogin: false,
      onChange: (String pin) {
        handleChange(pin: pin);
      },
      onSubmit: (String pin) {
        handleSubmit(pin: pin);
      },
    );
  }

  void handleChange({required String pin}) {
    setState(() {
      currentPin = pin;
    });
  }

  void handleSubmit({required String pin}) {
    if (pin.length < 4 || (pin != '0000' && pin != '1111')) {
      Utils.myErrorDialog(context: context, message: "Incorrect Pin");
    } else
      handleAuthentication(pin: pin);
  }

  handleFingerPrint() async {
    BiometricAuth biometricAuth = BiometricAuth(context: context);
    if (await biometricAuth.checkBiometric()) {
      biometricAuth.getAvailableBiometrics().then(
            (value) => value.contains(BiometricType.fingerprint)
                ? biometricAuth.authenticate().then(
                      (value) => value
                          ? handleAuthentication(pin: '1111')
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

  Future<void> handleAuthentication({required String pin}) async {
    pin == '0000' ? UserData.saveUserId(0) : UserData.saveUserId(1);

    UserModel currentUser = await UserData().currentUserInfo();

    //To show signin message
    final snackBar =
        SnackBar(content: Text('Signed in as ' + currentUser.name));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);

    Navigator.pushNamed(context, BottomNavBarScreen.id);
  }
}
