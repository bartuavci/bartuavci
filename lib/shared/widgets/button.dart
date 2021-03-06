import 'package:flutter/material.dart';
import '../constant/colors.dart';

class MyButton extends StatelessWidget {
  const MyButton({
    Key? key,
    required this.text,
    this.margin = const EdgeInsets.all(0),
    this.borderRadius = 17,
  }) : super(key: key);
  final String text;
  final EdgeInsets margin;
  final double borderRadius;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      padding: EdgeInsets.symmetric(vertical: 10),
      width: 200,
      decoration: BoxDecoration(
          color: ConstantColors.darkGreen,
          borderRadius: BorderRadius.circular(borderRadius)),
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
