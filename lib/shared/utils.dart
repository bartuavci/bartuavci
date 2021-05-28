import 'dart:math';

import 'package:flutter/material.dart';

import 'constant/colors.dart';
import 'constant/styles.dart';

class Utils {
  static double screenWidth({required BuildContext context}) {
    print("Width " + MediaQuery.of(context).size.width.toString());
    return MediaQuery.of(context).size.width;
  }

  static double screenHeight({required BuildContext context}) {
    print("Height " + MediaQuery.of(context).size.height.toString());

    return MediaQuery.of(context).size.height;
  }

  static String randomImageUrl() {
    int width = Random().nextInt(500) + 100;
    int height = Random().nextInt(500) + 100;
    return "https://picsum.photos/$width/$height";
  }

  static Color randomColor() {
    return Colors.primaries[Random().nextInt(Colors.primaries.length)];
  }

  static Future<dynamic> myErrorDialog(
      {required BuildContext context, required String message}) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          'Error!',
          style: TextStyle(color: Colors.red),
        ),
        content: Text(
          message,
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

  static AppBar myAppBar({required String text, Color? backgroundColor}) {
    return AppBar(
      backgroundColor: backgroundColor,
      toolbarHeight: 86,
      automaticallyImplyLeading: false,
      title: Text(
        text,
        style: ConstantStyles.textStyle8,
      ),
      actions: [
        Container(
          margin: EdgeInsets.all(14),
          width: 58,
          height: 58,
          decoration: BoxDecoration(
            border: Border.all(
              color: ConstantColors.darkGreen,
              width: 3,
            ),
            shape: BoxShape.circle,
            image: DecorationImage(
              image: AssetImage(
                'assets/images/user_1.jpg',
              ),
            ),
          ),
        )
      ],
    );
  }
}
