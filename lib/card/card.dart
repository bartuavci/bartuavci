import 'package:flutter/material.dart';
import 'package:neo/shared/constant/styles.dart';
import 'package:neo/shared/constant/values.dart';
import 'package:neo/shared/utils.dart';

class CardScreen extends StatelessWidget {
  static const id = 'Card';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Utils.myAppBar(context, text: id),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(32.0),
            child: Image.asset('${BASE_CARD_URL}image_1.png'),
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              buildIcons(image: 'image_2', text: 'PIN'),
              SizedBox(
                width: 30,
              ),
              buildIcons(image: 'image_3', text: 'Freeze'),
            ],
          ),
          SizedBox(
            height: 70,
          ),
          buildIcons(image: 'image_4', text: 'Hold near reader')
        ],
      ),
    );
  }

  Column buildIcons({
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
          style: ConstantStyles.textStyleGrey1,
        ),
      ],
    );
  }
}
