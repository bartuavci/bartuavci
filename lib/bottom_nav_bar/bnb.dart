import 'package:flutter/material.dart';

import '../card/card_screen.dart';
import '../friends/friends_screen.dart';
import '../home/home.dart';
import '../payments/payments_screen.dart';
import '../shared/constant/colors.dart';
import '../spaces/spaces.dart';

class BottomNavBarScreen extends StatefulWidget {
  static const id = 'BottomNavBar';

  @override
  _BottomNavBarScreenState createState() => _BottomNavBarScreenState();
}

class _BottomNavBarScreenState extends State<BottomNavBarScreen> {
  int _selectedIndex = 2;
  List<Widget> screens = <Widget>[
    FriendsScreen(),
    SpacesScreen(),
    HomeScreen(),
    CardScreen(),
    PaymentsScreen()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: screens,
      ),
      // screens[_selectedIndex],
      bottomNavigationBar: Container(
        height: 75,
        decoration: BoxDecoration(
            color: ConstantColors.darkGreen,
            border: Border(
                top: BorderSide(width: 2, color: ConstantColors.darkGreen))),
        child: BottomNavigationBar(
          selectedFontSize: 12,
          unselectedFontSize: 12,
          unselectedLabelStyle: TextStyle(color: ConstantColors.gray1),
          selectedLabelStyle: TextStyle(color: ConstantColors.black),
          items: bottomNavigationBarItems,
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          selectedItemColor: ConstantColors.lightGreen,
          unselectedItemColor: ConstantColors.darkGreen,
          type: BottomNavigationBarType.fixed,
        ),
      ),
    );
  }

  List<BottomNavigationBarItem> get bottomNavigationBarItems {
    return List.generate(
      label.length,
      (index) => BottomNavigationBarItem(
        icon: Icon(bnvInitialIcons[index]),
        // activeIcon: Icon(bnvActiveIcons[index]),

        label: label[index],
      ),
    );
  }

  List<String> label = [
    FriendsScreen.id,
    SpacesScreen.id,
    HomeScreen.id,
    CardScreen.id,
    PaymentsScreen.id,
  ];
  List<IconData> bnvInitialIcons = [
    Icons.contacts,
    Icons.grid_view_sharp,
    Icons.home,
    Icons.credit_card_rounded,
    Icons.payments_rounded
  ];
  // List<IconData> bnvActiveIcons = [
  //   Icons.home,
  //   Icons.category,
  //   Icons.shopping_cart,
  //   Icons.person
  // ];

  void _onItemTapped(int value) {
    setState(() => _selectedIndex = value);
  }
}
