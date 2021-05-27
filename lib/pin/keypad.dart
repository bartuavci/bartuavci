import 'package:flutter/material.dart';
import 'package:neo/shared/constant/colors.dart';
import 'package:neo/shared/constant/styles.dart';

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
              buttonWidget('1'),
              buttonWidget('2'),
              buttonWidget('3'),
            ],
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              buttonWidget('4'),
              buttonWidget('5'),
              buttonWidget('6'),
            ],
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              buttonWidget('7'),
              buttonWidget('8'),
              buttonWidget('9'),
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
              buttonWidget('0'),
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

  buttonWidget(String buttonText) {
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
          child: Text(
            buttonText,
            style: ConstantStyles.textStyle5,
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
