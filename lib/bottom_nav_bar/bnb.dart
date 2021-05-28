import 'package:flutter/material.dart';

import 'package:neo/card/card.dart';
import 'package:neo/friends/friends.dart';
import 'package:neo/home/home.dart';
import 'package:neo/payments/payments.dart';
import 'package:neo/shared/constant/colors.dart';

import 'package:neo/spaces/spaces.dart';

class BottomNavBarScreen extends StatefulWidget {
  static const id = 'BottomNavBar';

  @override
  _BottomNavBarScreenState createState() => _BottomNavBarScreenState();
}

class _BottomNavBarScreenState extends State<BottomNavBarScreen> {
  int _selectedIndex = 2;

  @override
  Widget build(BuildContext context) {
    List<Widget> screens = <Widget>[
      FriendsScreen(),
      SpacesScreen(),
      HomeScreen(),
      CardScreen(),
      PaymentsScreen()
    ];

    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: screens,
      ),
      // screens[_selectedIndex],
      bottomNavigationBar: Container(
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
