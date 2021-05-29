import 'package:flutter/material.dart';
import '../constant/values.dart';

import '../utils.dart';

class MyQrCodeWidget extends StatelessWidget {
  final String imageName;
  const MyQrCodeWidget({
    Key? key,
    required this.imageName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      BASE_QR_URL + imageName,
      width: Utils.screenWidth(context: context) / 1.5,
      height: Utils.screenWidth(context: context) / 1.5,
    );
  }
}
