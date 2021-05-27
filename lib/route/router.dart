import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:neo/auth/auth.dart';
import 'package:neo/pin/pin.dart';
import 'package:neo/shared/constant/values.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case "/":
        return MaterialPageRoute(
          builder: (BuildContext context) => AuthScreen(),
        );
      case ROUTE_PIN:
        return MaterialPageRoute(
          builder: (BuildContext context) => PinScreen(),
        );
      // case ROUTE_PRODUCT:
      //   return MaterialPageRoute(
      //     builder: (BuildContext context) => ProductScreen(),
      //   );

      default:
        return MaterialPageRoute(
          builder: (BuildContext context) => buildNoRouteWidget(settings),
        );
    }
  }

  Scaffold buildNoRouteWidget(RouteSettings settings) {
    return Scaffold(
      body: Center(
        child: Text('No route defined for ${settings.name}'),
      ),
    );
  }
}
