import 'package:flutter/material.dart';

import 'package:neo/friends/friends_model.dart';
import 'package:neo/shared/constant/styles.dart';
import 'package:neo/shared/constant/values.dart';
import 'package:neo/shared/utils.dart';
import 'package:neo/shared/widgets/my_card.dart';

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
      appBar: Utils.myAppBar(text: 'Friends'),
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
                  return MyCard(
                    imageUrl: friendsList[index].imageUrl,
                    title: friendsList[index].name,
                    subtitle: friendsList[index].userName,
                    endText: '',
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
