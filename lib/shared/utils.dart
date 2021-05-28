import 'dart:math';

import 'package:flutter/material.dart';

import 'constant/colors.dart';
import 'constant/styles.dart';

class Utils {
  static double screenWidth({required BuildContext context}) {
    return MediaQuery.of(context).size.width;
  }

  static double screenHeight({required BuildContext context}) {
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
}
