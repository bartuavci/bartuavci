import 'package:flutter/material.dart';
import 'package:neo/shared/utils.dart';

class CardScreen extends StatelessWidget {
  static const id = 'Card';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Utils.myAppBar(text: id),
      body: Column(
        children: <Widget>[
          Image.asset(''),
          Row(
            children: <Widget>[
              Column(
                children: <Widget>[
                  Image.asset('name'),
                  Text(''),
                ],
              ),
              Column(
                children: <Widget>[
                  Image.asset('name'),
                  Text(''),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
