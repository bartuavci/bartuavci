import 'package:flutter/material.dart';
import 'package:neo/route/router.dart';
import 'package:neo/shared/constant/colors.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: buildTheme(),
      onGenerateRoute: AppRouter().generateRoute,
    );
  }

  ThemeData buildTheme() {
    return ThemeData(
      // primarySwatch: Colors.blue,
      appBarTheme: AppBarTheme(
        elevation: 0,
        color: ConstantColors.lightGreen,
        iconTheme: IconThemeData(
          color: ConstantColors.appbarBack,
        ),
      ),
    );
  }
}
