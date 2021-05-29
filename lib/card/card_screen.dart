import 'package:flutter/material.dart';
import 'card_approved_screen.dart';
import '../shared/constant/styles.dart';
import '../shared/constant/values.dart';
import '../shared/utils.dart';

class CardScreen extends StatelessWidget {
  static const id = 'Card';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Utils.myAppBar(context, text: id, showAction: true),
      body: Column(
        children: <Widget>[
          buildCard(),
          buildPinAndFreeze(),
          SizedBox(height: 60),
          buildHoldNearReader(context)
        ],
      ),
    );
  }

  GestureDetector buildHoldNearReader(BuildContext context) {
    return GestureDetector(
        onTap: () => Navigator.pushNamed(context, CardApprovedScreen.id),
        child: buildIcon(image: 'image_4', text: 'Hold near reader'));
  }

  Row buildPinAndFreeze() {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        buildIcon(image: 'image_2', text: 'PIN'),
        SizedBox(
          width: 30,
        ),
        buildIcon(image: 'image_3', text: 'Freeze'),
      ],
    );
  }

  Padding buildCard() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(32, 70, 32, 10),
      child: Image.asset('${BASE_CARD_URL}image_1.png'),
    );
  }

  Column buildIcon({
    required String image,
    required String text,
  }) {
    bool isWifiIcon = image == 'image_4';
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(bottom: isWifiIcon ? 8.0 : 0),
          child: Image.asset(
            '$BASE_CARD_URL$image.png',
            width: isWifiIcon ? 55 : 70,
            height: isWifiIcon ? 55 : 70,
          ),
        ),
        Text(
          text,
          style: ConstantStyles.textStyleGrey3,
        ),
      ],
    );
  }
}
