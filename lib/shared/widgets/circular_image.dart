import 'package:flutter/material.dart';
import 'package:neo/user/user_data.dart';
import 'package:neo/user/user_model.dart';

import '../constant/colors.dart';

class MyCircularImage extends StatelessWidget {
  final double allMargin;
  final double width;
  final double height;

  const MyCircularImage({
    Key? key,
    this.allMargin = 14,
    this.width = 58,
    this.height = 58,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: UserData().currentUserInfo(),
      builder: (context, AsyncSnapshot<UserModel> snapshot) {
        if (snapshot.hasData) {
          return Container(
            margin: EdgeInsets.all(allMargin),
            width: height,
            height: width,
            decoration: BoxDecoration(
              border: Border.all(
                color: ConstantColors.darkGreen,
                width: 3,
              ),
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage(
                  snapshot.data!.picture,
                  // '${BASE_USERS_URL}user_1.jpg',
                ),
              ),
            ),
          );
        } else {
          return Text('');
        }
      },
    );
  }
}
