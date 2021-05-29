import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:neo/bottom_nav_bar/bnb.dart';
import 'package:neo/card/card.dart';
import 'package:neo/friends/friend_qr_screen.dart';
import 'package:neo/friends/friends_screen.dart';
import 'package:neo/home/home.dart';
import 'package:neo/payments/payments.dart';
import 'package:neo/pin/pin.dart';
import 'package:neo/profile/profile_screen.dart';
import 'package:neo/profile/user_qr.dart';
import 'package:neo/spaces/rent_screen.dart';
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
      case FriendQrScreen.id:
        return buildRoute(screen: FriendQrScreen());
      case HomeScreen.id:
        return buildRoute(screen: HomeScreen());
      case PaymentsScreen.id:
        return buildRoute(screen: PaymentsScreen());
      case SpacesScreen.id:
        return buildRoute(screen: SpacesScreen());
      case RentScreen.id:
        return buildRoute(screen: RentScreen());
      case ProfileScreen.id:
        return buildRoute(screen: ProfileScreen());
      case UserQrScreen.id:
        return buildRoute(screen: UserQrScreen());

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
