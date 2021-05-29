import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';

import '../shared/utils.dart';

class BiometricAuth {
  final BuildContext context;
  BiometricAuth({
    required this.context,
  });
  LocalAuthentication auth = LocalAuthentication();

//To check whether there is local authentication available on this device or not, call canCheckBiometrics:
  Future<bool> checkBiometric() async {
    bool canCheckBiometric = false;
    try {
      canCheckBiometric = await auth.canCheckBiometrics;
    } on PlatformException catch (e) {
      handleException(exception: e);
    }
    // if (!mounted) return false;

    print("Can check biometric " + canCheckBiometric.toString());
    return canCheckBiometric;
  }

  //To get a list of enrolled biometrics, call getAvailableBiometrics:
  Future<List<BiometricType>> getAvailableBiometrics() async {
    List<BiometricType> availableBiometric = [];
    try {
      availableBiometric = await auth.getAvailableBiometrics();
    } on PlatformException catch (e) {
      handleException(exception: e);
    }
    // if (!mounted) return availableBiometric;

    print("availableBiometric " + availableBiometric.toString());
    return availableBiometric;
  }

  Future<bool> authenticate() async {
    bool authenticated = false;
    try {
      authenticated = await auth.authenticate(
        biometricOnly: true,
        localizedReason:
            "Please put your finger on your fingerprint sensor in order to validate",
        useErrorDialogs: true,
        stickyAuth: false,
      );
    } on PlatformException catch (e) {
      handleException(exception: e);
    }
    // if (!mounted) return;

    // authenticated ? print('authenticated') : print('Not authenticated');
    return authenticated;
  }

  void handleException({required PlatformException exception}) {
    Utils.myErrorDialog(
        context: context, message: exception.message.toString());
    print("Platform exception _authenticate " + exception.message.toString());
  }
}
