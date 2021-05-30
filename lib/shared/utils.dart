import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../profile/profile_screen.dart';
import 'widgets/appbar_close.dart';

import 'widgets/circular_image.dart';

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

  static AppBar myAppBar(
    BuildContext context, {
    required String text,
    Color? backgroundColor,
    bool showAction = false,
    bool showLeading = false,
    double height = 86,
  }) {
    return AppBar(
      backgroundColor: backgroundColor,
      toolbarHeight: height,
      // leadingWidth: 50,
      automaticallyImplyLeading: false,
      leading: showLeading ? MyAppBarCancelIcon() : null,
      title: Text(
        text,
        style: ConstantStyles.textStyle8,
      ),
      actions: [
        showAction
            ? GestureDetector(
                onTap: () => Navigator.pushNamed(context, ProfileScreen.id),
                child: MyCircularImage())
            : SizedBox.shrink()
      ],
    );
  }

// THis is to format number like 123456 to 123,456
  static String formatNumberToPrice({required int number}) {
    return NumberFormat("#,###", "en_US").format(number);
  }
}
