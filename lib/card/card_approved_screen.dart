import 'package:flutter/material.dart';

import '../shared/constant/values.dart';
import '../shared/utils.dart';
import '../shared/widgets/done.dart';

class CardApprovedScreen extends StatelessWidget {
  static const id = 'CardApproved';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Utils.myAppBar(context,
          text: "Card", showLeading: true, showAction: true),
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(32, 0, 32, 0),
              child: Image.asset('${BASE_CARD_URL}image_1.png'),
            ),
          ),
          Spacer(
            flex: 1,
          ),
          Expanded(
            flex: 2,
            child: MyDoneWidget(
              text: 'Approved',
            ),
          ),
        ],
      ),
    );
  }
}
