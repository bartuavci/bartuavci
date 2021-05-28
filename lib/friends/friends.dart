import 'package:flutter/material.dart';
import 'package:neo/friends/friends_model.dart';
import 'package:neo/shared/constant/colors.dart';
import 'package:neo/shared/constant/styles.dart';
import 'package:neo/shared/utils.dart';

class FriendsScreen extends StatelessWidget {
  static const id = 'Friends';
  final List<FriendsModel> friendsList = [
    FriendsModel(name: "Bartu Avci ", userName: "@Bartu5746"),
    FriendsModel(name: "Muhannad Alhomied", userName: "@Muhannad6546"),
    FriendsModel(name: "Afroze Khan", userName: "@Afroze7348"),
    FriendsModel(name: "Safa Fatima", userName: "@Safa1301"),
    FriendsModel(name: "Sakeena Ali", userName: "@Sakeena8479"),
    FriendsModel(name: "Ahmed Afzal", userName: "@Ahmed6584"),
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
                  return buildList(index, friendsList[index].name,
                      friendsList[index].userName);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildList(int index, String name, String userName) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 9),
      decoration: BoxDecoration(
        border: Border(
          left: buildBorder(color: ConstantColors.darkGreen, width: 9),
          bottom: buildBorder(),
          right: buildBorder(),
          top: buildBorder(),
        ),
      ),
      child: Row(
        children: [
          buildCircularImage(index),
          Container(
            padding: EdgeInsets.only(left: 6),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: ConstantStyles.textStyle9,
                ),
                Text(
                  userName,
                  style: ConstantStyles.textStyleGrey,
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Container buildCircularImage(int index) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        border: Border.all(
          color: ConstantColors.white,
          width: 3,
        ),
        shape: BoxShape.circle,
        image: DecorationImage(
          image: AssetImage(
            'assets/images/user_${index + 2}.jpg',
          ),
        ),
      ),
    );
  }

  BorderSide buildBorder({
    Color color = ConstantColors.lightGreen,
    double width = 2,
  }) {
    return BorderSide(
      color: color,
      width: width,
    );
  }
}
