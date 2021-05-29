import 'package:flutter/material.dart';
import 'package:neo/shared/constant/colors.dart';

class MyButton extends StatelessWidget {
  const MyButton({
    Key? key,
    required this.text,
    this.margin = const EdgeInsets.all(0),
  }) : super(key: key);
  final String text;
  final EdgeInsets margin;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      padding: EdgeInsets.symmetric(vertical: 10),
      width: 200,
      decoration: BoxDecoration(
          color: ConstantColors.darkGreen,
          borderRadius: BorderRadius.circular(17)),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 18,
          color: Colors.white,
        ),
      ),
    );
  }
}
