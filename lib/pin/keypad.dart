import 'package:flutter/material.dart';
import '../shared/constant/colors.dart';
import '../shared/constant/styles.dart';

class KeyPad extends StatelessWidget {
  final double buttonSize;
  final TextEditingController pinController;
  final Function onChange;
  final Function onSubmit;
  final bool isPinLogin;

  KeyPad({
    Key? key,
    this.buttonSize = 60.0,
    required this.pinController,
    required this.onChange,
    required this.onSubmit,
    required this.isPinLogin,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 30, right: 30),
      child: Column(
        children: [
          SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              buttonWidget('1', ''),
              buttonWidget('2', 'ABC'),
              buttonWidget('3', 'DEF'),
            ],
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              buttonWidget('4', 'GHI'),
              buttonWidget('5', 'JKL'),
              buttonWidget('6', 'MNO'),
            ],
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              buttonWidget('7', 'PQRS'),
              buttonWidget('8', 'TUV'),
              buttonWidget('9', 'WXYZ'),
            ],
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              iconButtonWidget(Icons.backspace_outlined, () {
                if (pinController.text.length > 0) {
                  pinController.text = pinController.text
                      .substring(0, pinController.text.length - 1);
                }
                if (pinController.text.length > 5) {
                  pinController.text = pinController.text.substring(0, 3);
                }
                onChange(pinController.text);
              }),
              buttonWidget('0', ''),
              !isPinLogin
                  ? iconButtonWidget(Icons.check, () {
                      if (pinController.text.length > 5) {
                        pinController.text = pinController.text.substring(0, 3);
                      }
                      onSubmit(pinController.text);
                    })
                  : Container(
                      width: buttonSize,
                    ),
            ],
          ),
        ],
      ),
    );
  }

  buttonWidget(String buttonText, String alphabet) {
    return InkWell(
      onTap: () {
        if (pinController.text.length <= 3) {
          pinController.text = pinController.text + buttonText;
          onChange(pinController.text);
        }
      },
      child: Container(
        height: buttonSize,
        width: buttonSize,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                buttonText,
                style: ConstantStyles.textStyle5,
              ),
              Visibility(
                visible: buttonText != 0.toString(),
                child: Text(
                  alphabet,
                  style: ConstantStyles.textStyle7,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  iconButtonWidget(IconData icon, void Function() function) {
    return InkWell(
      onTap: function,
      child: Container(
        height: buttonSize,
        width: buttonSize,
        child: Center(
          child: Icon(
            icon,
            size: 30,
            color: ConstantColors.darkGreen,
          ),
        ),
      ),
    );
  }
}
