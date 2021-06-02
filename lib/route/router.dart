import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:neo/payments/screens/payment_screen.dart';
import 'package:neo/payments/screens/qrcode_view_page.dart';
import 'package:neo/payments/screens/send_screen.dart';
import 'package:neo/payments/screens/sent_screen.dart';

import '../bottom_nav_bar/bnb.dart';
import '../card/card_approved_screen.dart';
import '../card/card_screen.dart';
import '../friends/friend_qr_screen.dart';
import '../friends/friends_screen.dart';
import '../home/home.dart';

import '../pin/pin.dart';
import '../profile/profile_screen.dart';
import '../profile/user_qr.dart';
import '../spaces/rent_screen.dart';
import '../spaces/spaces.dart';
import '../welcome/welcome.dart';

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
      case CardApprovedScreen.id:
        return buildRoute(screen: CardApprovedScreen());
      case FriendsScreen.id:
        return buildRoute(screen: FriendsScreen());
      case FriendQrScreen.id:
        return buildRoute(screen: FriendQrScreen());
      case HomeScreen.id:
        return buildRoute(screen: HomeScreen());
      case PaymentScreen.id:
        return buildRoute(screen: PaymentScreen());
      case QRViewPage.id:
        return buildRoute(screen: QRViewPage());
      case SendScreen.id:
        return buildRoute(screen: SendScreen());
      case SentScreen.id:
        return buildRoute(screen: SentScreen());
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
