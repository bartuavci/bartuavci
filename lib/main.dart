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
      theme: buildTheme(),
      onGenerateRoute: AppRouter().generateRoute,
    );
  }

  ThemeData buildTheme() {
    return ThemeData(
      scaffoldBackgroundColor: ConstantColors.white,
      iconTheme: IconThemeData(color: ConstantColors.gray1),
      appBarTheme: AppBarTheme(
        elevation: 0,
        color: ConstantColors.white,
        iconTheme: IconThemeData(
          color: ConstantColors.appbarBack,
        ),
      ),
    );
  }
}
