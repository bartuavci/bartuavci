import 'package:flutter/material.dart';
import 'friend_qr_screen.dart';
import '../shared/constant/styles.dart';

import '../shared/utils.dart';
import '../shared/widgets/card.dart';
import 'friends_data.dart';

class FriendsScreen extends StatelessWidget {
  static const id = 'Friends';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Utils.myAppBar(context, text: 'Friends', showAction: true),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14.0),
        width: double.maxFinite,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildAdd(),
            buildList(),
          ],
        ),
      ),
    );
  }

  Expanded buildList() {
    return Expanded(
      child: ListView.builder(
        padding: EdgeInsets.symmetric(vertical: 14),
        itemCount: friendsList.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () => handleTap(context, index: index),
            child: MyCardWidget(
              imageUrl: friendsList[index].imageUrl,
              title: friendsList[index].name,
              subtitle: friendsList[index].userName,
              endText: '',
            ),
          );
        },
      ),
    );
  }

  Padding buildAdd() {
    return Padding(
      padding: EdgeInsets.only(bottom: 14),
      child: Text(
        '+ Add',
        style: ConstantStyles.textStyle13,
      ),
    );
  }

  handleTap(BuildContext context, {required int index}) {
    if (index == 0) Navigator.pushNamed(context, FriendQrScreen.id);
  }
}
