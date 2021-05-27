import 'dart:math';

import 'package:flutter/material.dart';

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
}
