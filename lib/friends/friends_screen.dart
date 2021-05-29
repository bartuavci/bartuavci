import 'package:flutter/material.dart';
import 'friend_qr_screen.dart';

import 'friends_model.dart';
import '../shared/constant/styles.dart';
import '../shared/constant/values.dart';
import '../shared/utils.dart';
import '../shared/widgets/card.dart';

class FriendsScreen extends StatelessWidget {
  static const id = 'Friends';
  final List<FriendsModel> friendsList = [
    FriendsModel(
        name: "Bartu Avci ",
        userName: "@Bartu5746",
        imageUrl: '${BASE_USERS_URL}image 12-0.png'),
    FriendsModel(
        name: "Muhannad Alhomied",
        userName: "@Muhannad6546",
        imageUrl: '${BASE_USERS_URL}image 12-1.png'),
    FriendsModel(
        name: "Afroze Khan",
        userName: "@Afroze7348",
        imageUrl: '${BASE_USERS_URL}image 12-2.png'),
    FriendsModel(
        name: "Safa Fatima",
        userName: "@Safa1301",
        imageUrl: '${BASE_USERS_URL}image 12-3.png'),
    FriendsModel(
        name: "Sakeena Ali",
        userName: "@Sakeena8479",
        imageUrl: '${BASE_USERS_URL}image 12-4.png'),
    FriendsModel(
        name: "Ahmed Afzal",
        userName: "@Ahmed6584",
        imageUrl: '${BASE_USERS_URL}image 12-5.png'),
  ];

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
            Padding(
              padding: EdgeInsets.only(bottom: 14),
              child: Text(
                '+ Add',
                style: ConstantStyles.textStyle13,
              ),
            ),
            Expanded(
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
            ),
          ],
        ),
      ),
    );
  }

  handleTap(BuildContext context, {required int index}) {
    if (index == 0) Navigator.pushNamed(context, FriendQrScreen.id);
  }
}
