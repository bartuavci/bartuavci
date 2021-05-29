import 'package:flutter/material.dart';
import 'user_qr.dart';
import '../shared/constant/colors.dart';
import '../shared/constant/styles.dart';
import '../shared/constant/values.dart';
import '../shared/utils.dart';
import '../shared/widgets/circular_image.dart';
import '../shared/widgets/navigate_next.dart';
import '../shared/widgets/profile_card.dart';

class ProfileScreen extends StatelessWidget {
  static const String id = 'Profile';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Utils.myAppBar(context, text: id, showLeading: true, height: 50),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(14, 14, 14, 0),
        child: ListView(
          children: [
            Row(
              children: <Widget>[
                MyCircularImage(
                  allMargin: 0,
                  height: 80,
                  width: 80,
                ),
                SizedBox(
                  width: 14,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    buildBasicInfo(
                        icon: Icons.person,
                        text: 'M. Akbar',
                        style: ConstantStyles.textStyleGrey4),
                    buildBasicInfo(
                        icon: Icons.email_outlined, text: 'm.akbar@gmail.com'),
                    buildBasicInfo(
                        icon: Icons.vertical_distribute_outlined,
                        text: 'IBAN 734298688083'),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            buildQrCodeCard(context),
            MyProfileCard(
                title: 'Personal Settings',
                subtitle: 'Manage your app settings and personal details'),
            MyProfileCard(
                title: 'Market Place',
                subtitle: 'View, connect and manage providers'),
            MyProfileCard(
                title: 'Account Information',
                subtitle: 'Account details and documents'),
            MyProfileCard(
                title: 'Statement', subtitle: 'Monthly transaction history'),
            MyProfileCard(
                title: 'Add Money',
                subtitle:
                    'Add money via cheques, local stores or bank transfers'),
            MyProfileCard(
                title: 'Overdraft', subtitle: 'View and manage your overdraft'),
            MyProfileCard(
                title: 'Refer a Friend',
                subtitle: 'Refer a friend, Neo plants a tree'),
            MyProfileCard(title: 'Help', subtitle: 'Get in touch'),
          ],
        ),
      ),
    );
  }

  Widget buildBasicInfo(
      {required IconData icon,
      required String text,
      style: ConstantStyles.textStyleGrey5}) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Row(
        children: <Widget>[
          Icon(
            icon,
            color: ConstantColors.darkGreen,
          ),
          SizedBox(
            width: 6,
          ),
          Text(
            text,
            style: style,
          ),
        ],
      ),
    );
  }

  Widget buildQrCodeCard(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, UserQrScreen.id),
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 4),
        padding: EdgeInsets.only(left: 14, right: 14),
        decoration: BoxDecoration(
          border: Border(
            left: buildBorder(color: ConstantColors.darkGreen, width: 9),
            bottom: buildBorder(),
            right: buildBorder(),
            top: buildBorder(),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Image.asset(
                  '${BASE_OTHERS_URL}image0.png',
                  width: 50,
                  height: 50,
                ),
                Container(
                  padding: EdgeInsets.only(left: 6),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'QR Code',
                        style: ConstantStyles.textStyle9,
                      ),
                      Text(
                        'Use your QR code to get paid.',
                        style: ConstantStyles.textStyleGrey1,
                      )
                    ],
                  ),
                ),
              ],
            ),
            MyNavigateNext()
          ],
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
