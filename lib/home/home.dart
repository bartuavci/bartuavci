import 'package:flutter/material.dart';
import 'package:neo/user/user_data.dart';
import '../shared/constant/colors.dart';
import '../shared/utils.dart';
import 'widgets/category_image.dart';
import 'widgets/home_screen_main.dart';

class HomeScreen extends StatelessWidget {
  static const id = 'Home';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ConstantColors.lightGreen,
      appBar: Utils.myAppBar(context,
          text: id,
          backgroundColor: ConstantColors.lightGreen,
          showAction: true),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            FutureBuilder(
                future: UserData().getUserId(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting)
                    return Text('Loading');
                  else {
                    if (snapshot.hasError)
                      return Text(snapshot.error.toString());
                    else
                      return HomeScreenMainWidget(userId: snapshot.data);
                  }
                }),
            CenterImageWidget(),
          ],
        ),
      ),
    );
  }
}
