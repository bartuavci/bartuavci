import 'package:flutter/material.dart';

class MyAppBarCancelIcon extends StatelessWidget {
  const MyAppBarCancelIcon({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => Navigator.pop(context),
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Icon(Icons.close),
        ));
  }
}
