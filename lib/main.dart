import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'route/router.dart';
import 'shared/constant/colors.dart';
import 'package:device_preview/device_preview.dart';

void main() {
  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
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
