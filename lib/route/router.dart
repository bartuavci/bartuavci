import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:neo/bottom_nav_bar/bnb.dart';
import 'package:neo/card/card.dart';
import 'package:neo/friends/friends.dart';
import 'package:neo/home/home.dart';
import 'package:neo/payments/payments.dart';
import 'package:neo/pin/pin.dart';
import 'package:neo/spaces/spaces.dart';
import 'package:neo/welcome/auth.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case "/":
        return buildRoute(screen: WelcomeScreen());
      case PinScreen.id:
        return buildRoute(screen: PinScreen());

      case BottomNavBarScreen.id:
        return buildRoute(screen: BottomNavBarScreen());
      case CardScreen.id:
        return buildRoute(screen: CardScreen());
      case FriendsScreen.id:
        return buildRoute(screen: FriendsScreen());
      case HomeScreen.id:
        return buildRoute(screen: HomeScreen());
      case PaymentsScreen.id:
        return buildRoute(screen: PaymentsScreen());
      case SpacesScreen.id:
        return buildRoute(screen: SpacesScreen());

      default:
        return MaterialPageRoute(
          builder: (BuildContext context) => buildNoRouteWidget(settings),
        );
    }
  }

  MaterialPageRoute<dynamic> buildRoute({required Widget screen}) {
    return MaterialPageRoute(
      builder: (BuildContext context) => screen,
    );
  }

  Scaffold buildNoRouteWidget(RouteSettings settings) {
    return Scaffold(
      body: Center(
        child: Text('No route defined for ${settings.name}'),
      ),
    );
  }
}
