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
            buildAboutUser(context),
            SizedBox(
              height: 10,
            ),
            buildQrCodeCard(context),
            MyProfileCardWidget(
                title: 'Personal Settings',
                subtitle: 'Manage your app settings and personal details'),
            MyProfileCardWidget(
                title: 'Market Place',
                subtitle: 'View, connect and manage providers'),
            MyProfileCardWidget(
                title: 'Account Information',
                subtitle: 'Account details and documents'),
            MyProfileCardWidget(
                title: 'Statement', subtitle: 'Monthly transaction history'),
            MyProfileCardWidget(
                title: 'Add Money',
                subtitle:
                    'Add money via cheques, local stores or bank transfers'),
            MyProfileCardWidget(
                title: 'Overdraft', subtitle: 'View and manage your overdraft'),
            MyProfileCardWidget(
                title: 'Refer a Friend',
                subtitle: 'Refer a friend, Neo plants a tree'),
            MyProfileCardWidget(title: 'Help', subtitle: 'Get in touch'),
          ],
        ),
      ),
    );
  }

  Row buildAboutUser(BuildContext context) {
    return Row(
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
              context,
              icon: Icons.person,
              text: 'M. Akbar',
              style: ConstantStyles.textStyleGrey4,
            ),
            buildBasicInfo(context,
                icon: Icons.email_outlined, text: 'm.akbar@gmail.com'),
            buildBasicInfo(context,
                icon: Icons.vertical_distribute_outlined,
                text: 'IBAN 734298688083'),
          ],
        ),
      ],
    );
  }

  Widget buildBasicInfo(
    BuildContext context, {
    required IconData icon,
    required String text,
    style: ConstantStyles.textStyleGrey5,
  }) {
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
          Container(
            width: Utils.screenWidth(context: context) / 2,
            child: Text(
              text,
              style: style,
              overflow: TextOverflow.ellipsis,
            ),
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
                  width: Utils.screenWidth(context: context) - 200,
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
